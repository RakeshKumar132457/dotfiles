return {
    {
        'neovim/nvim-lspconfig',
        event = { "BufReadPre", "BufNewFile" },
        cmd = { "LspInfo", "LspInstall", "LspUninstall" },
        dependencies = {
            {
                "williamboman/mason.nvim",
                cmd = "Mason",
                build = ":MasonUpdate",
                config = function()
                    require('mason').setup()
                end
            },
            {
                "williamboman/mason-lspconfig.nvim",
                cmd = { "LspInstall", "LspUninstall" },
                config = function()
                    require('mason-lspconfig').setup({
                        ensure_installed = { 'emmet_ls', 'clangd', 'ts_ls', 'pyright', 'rust_analyzer', 'html', 'lua_ls', 'tailwindcss' }
                    })
                end
            },
            {
                "folke/neodev.nvim",
                ft = "lua",
                config = function()
                    require('neodev').setup({})
                end
            },
            {
                "nvimtools/none-ls.nvim",
                event = { "BufReadPre", "BufNewFile" },
                config = function()
                    local null_ls = require('null-ls')
                    null_ls.setup({
                        sources = {
                            null_ls.builtins.formatting.black.with({ extra_args = { "--line-length", "120" } }),
                            null_ls.builtins.formatting.prettier.with({ extra_args = { "--tab-width", "4", "--print-width", "120" } }),
                        }
                    })
                end
            },
            {
                "j-hui/fidget.nvim",
                tag = "legacy",
                event = "LspAttach",
                config = function()
                    require('fidget').setup({})
                end
            }
        },
        config = function()
            local lspconfig = require('lspconfig')

            vim.diagnostic.config({
                virtual_text = false,
                signs = true,
                underline = true,
                update_in_insert = false,
                severity_sort = true,
            })

            local signs = {
                Error = "",
                Warn = "",
                Hint = "",
                Info = ""
            }
            for type, icon in pairs(signs) do
                local hl = "DiagnosticSign" .. type
                vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
            end

            local hl_groups = {
                DiagnosticUnderlineError = { undercurl = true, sp = "#ff0000" },
                DiagnosticUnderlineWarn = { undercurl = true, sp = "#ffaa00" },
                DiagnosticUnderlineHint = { undercurl = true, sp = "#00ff00" },
                DiagnosticUnderlineInfo = { undercurl = true, sp = "#0000ff" },
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

            local capabilities = vim.lsp.protocol.make_client_capabilities()
            capabilities.textDocument.foldingRange = {
                dynamicRegistration = false,
                lineFoldingOnly = true
            }

            local on_attach = function(client, bufnr)
                vim.api.nvim_create_autocmd("CursorHold", {
                    buffer = bufnr,
                    callback = function()
                        local opts = {
                            focusable = false,
                            close_events = { "BufLeave", "CursorMoved", "InsertEnter", "FocusLost" },
                            border = 'rounded',
                            source = 'always',
                            prefix = ' ',
                            scope = 'cursor',
                        }
                        vim.diagnostic.open_float(nil, opts)
                    end
                })
            end

            for lsp, config in pairs(servers) do
                lspconfig[lsp].setup {
                    on_attach = on_attach,
                    capabilities = capabilities,
                    settings = config.settings
                }
            end

            -- LSP-related keymaps
            vim.keymap.set({ 'n', 'v' }, '<leader>fb', function() vim.lsp.buf.format({ async = true }) end,
                { silent = true, desc = '[F]ormatting [B]uffer' })
            vim.keymap.set('n', '<leader>ld', vim.lsp.buf.definition,
                { noremap = false, silent = true, desc = '[L]SP [D]efinition' })
            vim.keymap.set('n', '<leader>ltd', vim.lsp.buf.type_definition,
                { noremap = false, silent = true, desc = '[L]SP [T]ype [D]efinition' })
            vim.keymap.set('n', '<leader>lca', vim.lsp.buf.code_action,
                { noremap = false, silent = true, desc = '[L]SP [C]ode [A]ction' })
            vim.keymap.set('n', '<leader>lrf', function() require('trouble').open('lsp_references') end,
                { noremap = true, silent = true, desc = '[L]SP [R]e[F]erences in Trouble' })
            vim.keymap.set('n', '<leader>lfa', vim.lsp.buf.add_workspace_folder,
                { silent = true, desc = '[L]SP current [F]older [A]dd' })
            vim.keymap.set('n', '<leader>lfr', vim.lsp.buf.remove_workspace_folder,
                { noremap = false, silent = true, desc = '[L]SP [F]older [R]emove ' })
            vim.keymap.set('n', '<leader>lfl', function() print(vim.inspect(vim.lsp.buf.list_workspace_folders())) end,
                { silent = true, noremap = true, desc = '[L]sp [F]olders [L]ist' })
            vim.keymap.set('n', '<leader>lrn', vim.lsp.buf.rename,
                { silent = true, noremap = true, desc = '[L]sp [R]e[Name]' })
        end
    },
    {
        "hrsh7th/nvim-cmp",
        event = { "InsertEnter", "CmdlineEnter" },
        dependencies = {
            { "hrsh7th/cmp-nvim-lsp",                event = "InsertEnter" },
            { "hrsh7th/cmp-buffer",                  event = "InsertEnter" },
            { "hrsh7th/cmp-path",                    event = "InsertEnter" },
            { "hrsh7th/cmp-cmdline",                 event = "CmdlineEnter" },
            { "hrsh7th/cmp-nvim-lsp-signature-help", event = "InsertEnter" },
            {
                "L3MON4D3/LuaSnip",
                event = "InsertEnter",
                dependencies = {
                    "rafamadriz/friendly-snippets",
                },
                config = function()
                    require("luasnip.loaders.from_lua").lazy_load({
                        paths = { vim.fn.stdpath("config") .. "/lua/snippets" }
                    })
                    require("luasnip.loaders.from_vscode").lazy_load()
                end,
            },
            { "saadparwaiz1/cmp_luasnip", event = "InsertEnter" },
        },
        config = function()
            local cmp = require('cmp')
            local luasnip = require('luasnip')

            cmp.setup({
                snippet = {
                    expand = function(args)
                        luasnip.lsp_expand(args.body)
                    end,
                },
                window = {
                    completion = cmp.config.window.bordered(),
                    documentation = cmp.config.window.bordered()
                },
                mapping = cmp.mapping.preset.insert({
                    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
                    ['<C-f>'] = cmp.mapping.scroll_docs(4),
                    ['<C-Space>'] = cmp.mapping.complete(),
                    ['<CR>'] = cmp.mapping.confirm({ select = true }),
                    ['<C-k>'] = cmp.mapping.select_prev_item(),
                    ['<C-j>'] = cmp.mapping.select_next_item(),
                    ['<Tab>'] = cmp.mapping(function(fallback)
                        if cmp.visible() then
                            cmp.select_next_item()
                        elseif luasnip.expand_or_jumpable() then
                            luasnip.expand_or_jump()
                        else
                            fallback()
                        end
                    end, { 'i', 's' }),
                    ['<S-Tab>'] = cmp.mapping(function(fallback)
                        if cmp.visible() then
                            cmp.select_prev_item()
                        elseif luasnip.jumpable(-1) then
                            luasnip.jump(-1)
                        else
                            fallback()
                        end
                    end, { 'i', 's' }),
                }),
                sources = cmp.config.sources({
                    { name = 'nvim_lsp' },
                    { name = 'luasnip' },
                    { name = 'nvim_lsp_signature_help' },
                }, {
                    { name = 'buffer' },
                    { name = 'path' },
                })
            })

            cmp.setup.cmdline(':', {
                mapping = cmp.mapping.preset.cmdline(),
                sources = cmp.config.sources({
                    { name = 'path' }
                }, {
                    { name = 'cmdline' }
                })
            })

            -- LuaSnip keymaps
            vim.keymap.set({ 'i', 's' }, '<C-k>', function()
                if luasnip.expand_or_jumpable() then
                    luasnip.expand_or_jump()
                end
            end, { silent = true })
            vim.keymap.set({ 'i', 's' }, '<C-j>', function()
                if luasnip.jumpable(-1) then
                    luasnip.jump(-1)
                end
            end, { silent = true })

            -- Update capabilities for LSP
            local capabilities = vim.lsp.protocol.make_client_capabilities()
            local ok, cmp_nvim_lsp = pcall(require, 'cmp_nvim_lsp')
            if ok then
                capabilities = cmp_nvim_lsp.default_capabilities(capabilities)
            end
            -- Update LSP configs with new capabilities
            local lspconfig = require('lspconfig')
            for lsp, _ in pairs(require('lspconfig.configs')) do
                if lspconfig[lsp].setup then
                    lspconfig[lsp].setup({ capabilities = capabilities })
                end
            end
        end
    }
}
