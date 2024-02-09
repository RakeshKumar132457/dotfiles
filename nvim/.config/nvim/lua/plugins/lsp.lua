return {
    'neovim/nvim-lspconfig',
    event = { 'BufReadPost' },
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
            ensure_installed = { 'clangd', 'tsserver', 'gopls', 'pyright', 'rust_analyzer', 'html', 'lua_ls' }
        })
        local null_ls = require('null-ls')

        local servers = {
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
                null_ls.builtins.formatting.prettier,
                -- null_ls.builtins.formatting.eslint,
            }
        })

        require('fidget').setup({})
    end
}
