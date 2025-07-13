return {
    {
        'neovim/nvim-lspconfig',
        event = { "BufReadPre", "BufNewFile" },
        cmd = "LspInfo",
        keys = {
            { "<leader>fb", vim.lsp.buf.format,      desc = "Format buffer", mode = { "n", "v" } },
            { "<leader>ca", vim.lsp.buf.code_action, desc = "Code actions",  mode = { "n", "v" } },
            { "<leader>rn", vim.lsp.buf.rename,      desc = "Rename symbol" },
        },
        dependencies = {
            {
                "williamboman/mason.nvim",
                cmd = "Mason",
                build = ":MasonUpdate",
                config = true,
            },
            -- {
            --     "williamboman/mason-lspconfig.nvim",
            --     cmd = { "LspInstall", "LspUninstall" },
            --     opts = {
            --         ensure_installed = {
            --             'emmet_ls', 'clangd', 'ts_ls', 'pyright',
            --             'rust_analyzer', 'html', 'lua_ls', 'tailwindcss'
            --         }
            --     }
            -- },
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
                config = function()
                    local null_ls = require('null-ls')
                    null_ls.setup({
                        sources = {
                            null_ls.builtins.formatting.black.with({ extra_args = { "--line-length", "120" } }),
                            null_ls.builtins.formatting.prettier.with({
                                prefer_local = "node_modules/.bin",
                                dynamic_command = function(params)
                                    if has_prettierrc_file() then
                                        return {}
                                    else
                                        return { "--tab-width", "2", "--print-width", "120", "--use-tabs", "false" }
                                    end
                                end,
                            }),
                        }
                    })
                end
            },
            'saghen/blink.cmp'
        },
        config = function()
            local lspconfig = require('lspconfig')

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
            })

            -- Custom diagnostic sign highlights
            local hl_groups = {
                DiagnosticUnderlineError = { undercurl = true, sp = "#ff0000" },
                DiagnosticUnderlineWarn  = { undercurl = true, sp = "#ffaa00" },
                DiagnosticUnderlineHint  = { undercurl = true, sp = "#00ff00" },
                DiagnosticUnderlineInfo  = { undercurl = true, sp = "#0000ff" },
            }
            for hl, opts in pairs(hl_groups) do
                vim.api.nvim_set_hl(0, hl, opts)
            end

            local servers = {
                emmet_ls = {},
                tailwindcss = {},
                clangd = {},
                ts_ls = {},
                gopls = {},
                pyright = {},
                rust_analyzer = {},
                html = {},
                lua_ls = {
                    settings = { Lua = { diagnostics = { globals = { 'vim' } } } }
                }
            }

            local on_attach = function(_, bufnr)
                vim.api.nvim_create_autocmd("CursorHold", {
                    buffer = bufnr,
                    callback = function()
                        local diagnostics = vim.diagnostic.get(bufnr, { lnum = vim.fn.line('.') - 1 })
                        if #diagnostics > 0 then
                            vim.diagnostic.open_float(nil, {
                                focusable = false,
                                close_events = { "CursorMoved", "InsertEnter" },
                                border = 'rounded',
                                source = 'always',
                                prefix = '',
                                scope = 'cursor',
                            })
                        end
                    end
                })
            end

            local capabilities = require('blink.cmp').get_lsp_capabilities()

            for server, config in pairs(servers) do
                lspconfig[server].setup({
                    on_attach = on_attach,
                    capabilities = capabilities,
                    settings = config.settings,
                })
            end
        end,
    },

    {
        "L3MON4D3/LuaSnip",
        dependencies = { "rafamadriz/friendly-snippets" },
        event = "InsertEnter",
        config = function()
            require("luasnip.loaders.from_lua").lazy_load({
                paths = { vim.fn.stdpath("config") .. "/lua/snippets" }
            })
            require("luasnip.loaders.from_vscode").lazy_load()

            local luasnip = require("luasnip")
            vim.keymap.set({ 'i', 's' }, '<C-k>', function()
                if luasnip.jumpable(-1) then luasnip.jump(-1) end
            end, { silent = true })
            vim.keymap.set({ 'i', 's' }, '<C-j>', function()
                if luasnip.expand_or_jumpable() then luasnip.expand_or_jump() end
            end, { silent = true })
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
                default = { 'lsp', 'path', 'buffer', 'snippets' },
                providers = {
                    lsp = {
                        name = 'LSP',
                        module = 'blink.cmp.sources.lsp',
                        score_offset = 10,
                        transform_items = function(ctx, items)
                            local seen = {}
                            local deduplicated = {}
                            for _, item in ipairs(items) do
                                local key = item.label .. (item.detail or "")
                                if not seen[key] then
                                    seen[key] = true
                                    item.source_name = "LSP"
                                    table.insert(deduplicated, item)
                                end
                            end
                            return deduplicated
                        end
                    },
                    buffer = {
                        name = 'Buffer',
                        module = 'blink.cmp.sources.buffer',
                        score_offset = -5,
                        min_keyword_length = 3,
                        transform_items = function(ctx, items)
                            local seen = {}
                            local deduplicated = {}
                            for _, item in ipairs(items) do
                                if not seen[item.label] then
                                    seen[item.label] = true
                                    item.source_name = "Buffer"
                                    table.insert(deduplicated, item)
                                end
                            end
                            return deduplicated
                        end
                    },
                    path = {
                        name = 'Path',
                        module = 'blink.cmp.sources.path',
                        score_offset = 0,
                        transform_items = function(ctx, items)
                            for _, item in ipairs(items) do
                                item.source_name = "Path"
                            end
                            return items
                        end
                    },
                    snippets = {
                        name = 'Snippets',
                        module = 'blink.cmp.sources.snippets',
                        score_offset = 5,
                        transform_items = function(ctx, items)
                            for _, item in ipairs(items) do
                                item.source_name = "Snippet"
                            end
                            return items
                        end
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
                            { "label",       "label_description", gap = 1 },
                            { "kind_icon",   "kind",              gap = 1 },
                            { "source_name", gap = 1 },
                        }
                    },
                    border = "single",
                },
                documentation = {
                    auto_show = true,
                    auto_show_delay_ms = 500,
                    window = { border = 'single' }
                },
                ghost_text = { enabled = false },
            },
            signature = {
                enabled = true,
                window = { border = "single" }
            }
        }
    }

}
