return {
    {
        'neovim/nvim-lspconfig',
        event = "VeryLazy",
        cmd = "LspInfo",
        dependencies = {
            {
                "williamboman/mason.nvim",
                cmd = "Mason",
                build = ":MasonUpdate",
                opts = {
                    ui = {
                        border = "rounded",
                        icons = {
                            package_installed = "✓",
                            package_pending = "➜",
                            package_uninstalled = "✗"
                        }
                    }
                },
            },
            {
                "williamboman/mason-lspconfig.nvim",
                opts = {
                    ensure_installed = {
                        'lua_ls', 'clangd', 'ts_ls', 'pyright',
                        'rust_analyzer', 'html', 'tailwindcss'
                    },
                    automatic_installation = true,
                }
            },
            { "folke/neodev.nvim", ft = "lua", opts = {} },
            {
                "j-hui/fidget.nvim",
                event = "LspAttach",
                opts = {
                    notification = {
                        window = { winblend = 0 }
                    }
                }
            },
            {
                "nvimtools/none-ls.nvim",
                event = { "BufReadPre", "BufNewFile" },
                dependencies = { "nvim-lua/plenary.nvim" },
                config = function()
                    local null_ls = require('null-ls')

                    local function has_prettierrc_file()
                        local markers = { ".prettierrc", ".prettierrc.json", ".prettierrc.js", "prettier.config.js" }
                        for _, marker in ipairs(markers) do
                            if vim.fn.filereadable(marker) == 1 then
                                return true
                            end
                        end
                        return false
                    end

                    null_ls.setup({
                        sources = {
                            null_ls.builtins.formatting.black.with({
                                extra_args = { "--line-length", "120" }
                            }),
                            null_ls.builtins.formatting.prettier.with({
                                prefer_local = "node_modules/.bin",
                                condition = function()
                                    return not has_prettierrc_file()
                                end,
                                extra_args = { "--tab-width", "2", "--print-width", "120" }
                            }),
                        }
                    })
                end
            },
            'saghen/blink.cmp'
        },
        config = function()
            local lspconfig = require('lspconfig')

            -- Diagnostic configuration
            vim.diagnostic.config({
                virtual_text = false,
                signs = {
                    text = {
                        [vim.diagnostic.severity.ERROR] = "",
                        [vim.diagnostic.severity.WARN]  = "",
                        [vim.diagnostic.severity.HINT]  = "",
                        [vim.diagnostic.severity.INFO]  = "",
                    },
                },
                underline = true,
                update_in_insert = false,
                severity_sort = true,
                float = {
                    border = "rounded",
                    source = "always",
                    header = "",
                    prefix = "",
                },
            })

            -- Diagnostic sign highlights
            local hl_groups = {
                DiagnosticUnderlineError = { undercurl = true, sp = "#ff0000" },
                DiagnosticUnderlineWarn  = { undercurl = true, sp = "#ffaa00" },
                DiagnosticUnderlineHint  = { undercurl = true, sp = "#00ff00" },
                DiagnosticUnderlineInfo  = { undercurl = true, sp = "#0000ff" },
            }
            for hl, opts in pairs(hl_groups) do
                vim.api.nvim_set_hl(0, hl, opts)
            end

            -- MODERN: Use LspAttach autocmd instead of on_attach
            vim.api.nvim_create_autocmd("LspAttach", {
                group = vim.api.nvim_create_augroup("lsp-attach", { clear = true }),
                callback = function(event)
                    local map = function(keys, func, desc)
                        vim.keymap.set("n", keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
                    end

                    -- Navigation
                    map("gd", require("telescope.builtin").lsp_definitions, "[G]oto [D]efinition")
                    map("gr", require("telescope.builtin").lsp_references, "[G]oto [R]eferences")
                    map("gI", require("telescope.builtin").lsp_implementations, "[G]oto [I]mplementation")
                    map("gy", require("telescope.builtin").lsp_type_definitions, "[G]oto T[y]pe Definition")
                    map("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")

                    -- Actions
                    map("<leader>rn", vim.lsp.buf.rename, "[R]e[n]ame")
                    map("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction")
                    map("K", vim.lsp.buf.hover, "Hover Documentation")

                    -- Format (modern API)
                    map("<leader>fb", function()
                        vim.lsp.buf.format({ async = false, timeout_ms = 2000 })
                    end, "[F]ormat [B]uffer")

                    -- Symbols
                    map("<leader>ds", require("telescope.builtin").lsp_document_symbols, "[D]ocument [S]ymbols")
                    map("<leader>ws", require("telescope.builtin").lsp_dynamic_workspace_symbols, "[W]orkspace [S]ymbols")

                    -- Diagnostics on hover
                    vim.api.nvim_create_autocmd("CursorHold", {
                        buffer = event.buf,
                        callback = function()
                            local opts = {
                                focusable = false,
                                close_events = { "CursorMoved", "InsertEnter", "BufHidden" },
                                border = "rounded",
                                source = "always",
                                prefix = " ",
                                scope = "cursor",
                            }
                            vim.diagnostic.open_float(nil, opts)
                        end
                    })

                    -- Highlight references under cursor
                    local client = vim.lsp.get_client_by_id(event.data.client_id)
                    if client and client.supports_method(vim.lsp.protocol.Methods.textDocument_documentHighlight) then
                        local highlight_augroup = vim.api.nvim_create_augroup("lsp-highlight", { clear = false })
                        vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
                            buffer = event.buf,
                            group = highlight_augroup,
                            callback = vim.lsp.buf.document_highlight,
                        })
                        vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
                            buffer = event.buf,
                            group = highlight_augroup,
                            callback = vim.lsp.buf.clear_references,
                        })

                        vim.api.nvim_create_autocmd("LspDetach", {
                            group = vim.api.nvim_create_augroup("lsp-detach", { clear = true }),
                            callback = function(event2)
                                vim.lsp.buf.clear_references()
                                vim.api.nvim_clear_autocmds({ group = "lsp-highlight", buffer = event2.buf })
                            end,
                        })
                    end

                    -- Inlay hints (Neovim 0.10+)
                    if client and client.supports_method(vim.lsp.protocol.Methods.textDocument_inlayHint) then
                        map("<leader>th", function()
                            vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ bufnr = event.buf }))
                        end, "[T]oggle Inlay [H]ints")
                    end
                end,
            })

            -- Capabilities
            local capabilities = vim.lsp.protocol.make_client_capabilities()
            capabilities = vim.tbl_deep_extend("force", capabilities, require('blink.cmp').get_lsp_capabilities())

            -- Server configurations
            local servers = {
                emmet_ls = {},
                tailwindcss = {},
                clangd = {},
                ts_ls = {},
                gopls = {},
                pyright = {
                    settings = {
                        python = {
                            analysis = {
                                autoSearchPaths = true,
                                diagnosticMode = "workspace",
                                useLibraryCodeForTypes = true
                            }
                        }
                    }
                },
                rust_analyzer = {
                    settings = {
                        ["rust-analyzer"] = {
                            checkOnSave = {
                                command = "clippy"
                            }
                        }
                    }
                },
                html = {},
                lua_ls = {
                    settings = {
                        Lua = {
                            runtime = { version = "LuaJIT" },
                            workspace = {
                                checkThirdParty = false,
                                library = {
                                    vim.env.VIMRUNTIME,
                                    "${3rd}/luv/library",
                                }
                            },
                            completion = {
                                callSnippet = "Replace"
                            },
                            diagnostics = {
                                globals = { "vim" },
                                disable = { "missing-fields" }
                            },
                            hint = {
                                enable = true,
                            },
                        }
                    }
                }
            }

            -- Setup Mason handlers
            require("mason-lspconfig").setup({
                handlers = {
                    function(server_name)
                        local server = servers[server_name] or {}
                        server.capabilities = vim.tbl_deep_extend("force", {}, capabilities, server.capabilities or {})
                        lspconfig[server_name].setup(server)
                    end,
                },
            })
        end,
    },

    {
        "L3MON4D3/LuaSnip",
        dependencies = { "rafamadriz/friendly-snippets" },
        event = "InsertEnter",
        build = "make install_jsregexp",
        config = function()
            require("luasnip.loaders.from_lua").lazy_load({
                paths = { vim.fn.stdpath("config") .. "/lua/snippets" }
            })
            require("luasnip.loaders.from_vscode").lazy_load()

            local luasnip = require("luasnip")

            vim.keymap.set({ "i", "s" }, "<C-k>", function()
                if luasnip.jumpable(-1) then
                    luasnip.jump(-1)
                end
            end, { silent = true, desc = "LuaSnip: Jump backward" })

            vim.keymap.set({ "i", "s" }, "<C-j>", function()
                if luasnip.expand_or_jumpable() then
                    luasnip.expand_or_jump()
                end
            end, { silent = true, desc = "LuaSnip: Expand or jump forward" })
        end
    },

    {
        'saghen/blink.cmp',
        event = { "InsertEnter", "CmdlineEnter" },
        version = '*',
        build = 'cargo build --release',
        opts = {
            keymap = { preset = 'super-tab' },
            appearance = {
                use_nvim_cmp_as_default = true,
                nerd_font_variant = 'mono'
            },
            sources = {
                default = { 'lsp', 'path', 'snippets', 'buffer' },
                providers = {
                    lsp = {
                        name = 'LSP',
                        module = 'blink.cmp.sources.lsp',
                        score_offset = 10,
                    },
                    path = {
                        name = 'Path',
                        module = 'blink.cmp.sources.path',
                        score_offset = 3,
                    },
                    snippets = {
                        name = 'Snippets',
                        module = 'blink.cmp.sources.snippets',
                        score_offset = 5,
                    },
                    buffer = {
                        name = 'Buffer',
                        module = 'blink.cmp.sources.buffer',
                        score_offset = -3,
                        min_keyword_length = 3,
                    }
                }
            },
            snippets = {
                preset = 'luasnip'
            },
            completion = {
                menu = {
                    draw = {
                        columns = {
                            { "label",     "label_description", gap = 1 },
                            { "kind_icon", "kind",              gap = 1 },
                        }
                    },
                    border = "rounded",
                },
                documentation = {
                    auto_show = true,
                    auto_show_delay_ms = 200,
                    window = { border = 'rounded' }
                },
                ghost_text = { enabled = true },
            },
            signature = {
                enabled = true,
                window = { border = "rounded" }
            }
        }
    }
}
