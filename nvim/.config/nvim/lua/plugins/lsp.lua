return {
    'neovim/nvim-lspconfig',
    event = { "BufReadPre", "BufNewFile" },
    cmd = { "LspInfo", "LspInstall", "LspUninstall", "Mason" },
    dependencies = {
        { "williamboman/mason.nvim" },
        { "williamboman/mason-lspconfig.nvim" },
        { "hrsh7th/cmp-nvim-lsp" },
        {
            "folke/neodev.nvim",
            ft = { "lua" },
            config = function()
                require('neodev').setup({})
            end
        },
        { "nvimtools/none-ls.nvim" },
        { "j-hui/fidget.nvim" }
    },
    config = function()
        require('mason').setup()
        require('mason-lspconfig').setup({
            ensure_installed = { 'emmet_ls', 'clangd', 'tsserver', 'gopls', 'pyright', 'rust_analyzer', 'html', 'lua_ls', 'tailwindcss' }
        })
        local null_ls = require('null-ls')
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


        local servers = {
            emmet_ls = {},
            tailwindcss = {},
            clangd = {},
            tsserver = {},
            gopls = {},
            pyright = {},
            rust_analyzer = {},
            html = {},
            lua_ls = {
                settings = {
                    Lua = {
                        diagnostics = {
                            globals = { 'vim' },
                        },
                    }
                }
            }
        }

        local capabilities = vim.lsp.protocol.make_client_capabilities()

        capabilities.textDocument.foldingRange = {
            dynamicRegistration = false,
            lineFoldingOnly = true
        }


        local default_capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

        local on_attach = function(client, bufnr)
        end

        for lsp, config in pairs(servers) do
            require('lspconfig')[lsp].setup {
                on_attach = on_attach,
                capabilities = default_capabilities,
                settings = config.settings
            }
        end
        null_ls.setup({
            sources = {
                null_ls.builtins.formatting.black,
                null_ls.builtins.formatting.prettier.with({
                    extra_args = { "--tab-width", "4", "--print-width", "120" },
                }),
                -- null_ls.builtins.formatting.eslint,
            }
        })

        vim.keymap.set({ 'n', 'v' }, '<leader>fb', function() vim.lsp.buf.format({ async = true }) end,
            { silent = true, desc = '[F]ormatting [B]uffer' })
        vim.keymap.set('n', '<leader>ld', vim.lsp.buf.definition,
            { noremap = false, silent = true, desc = '[L]SP [D]efinition' })
        vim.keymap.set('n', '<leader>ltd', vim.lsp.buf.type_definition,
            { noremap = false, silent = true, desc = '[L]SP [T]ype [D]efinition' })
        vim.keymap.set('n', '<leader>lca', vim.lsp.buf.code_action,
            { noremap = false, silent = true, desc = '[L]SP [C]ode [A]ction' })
        vim.keymap.set('n', '<leader>lr', vim.lsp.buf.references,
            { noremap = false, silent = true, desc = '[L]SP [R]eferences' })
        vim.keymap.set('n', '<leader>lfa', function()
            vim.lsp.buf.add_workspace_folder()
        end, { silent = true, desc = '[L]SP current [F]older [A]dd' })
        vim.keymap.set('n', '<leader>lfr', vim.lsp.buf.remove_workspace_folder,
            { noremap = false, silent = true, desc = '[L]SP [F]older [R]emove ' })
        vim.keymap.set('n', '<leader>lfl', function() print(vim.inspect(vim.lsp.buf.list_workspace_folders())) end,
            { silent = true, noremap = true, desc = '[L]sp [F]olders [L]ist' })
        vim.keymap.set('n', '<leader>lrn', function() print(vim.inspect(vim.lsp.buf.rename())) end,
            { silent = true, noremap = true, desc = '[L]sp [R]e[Name]' })

        require('fidget').setup({})
    end
}
