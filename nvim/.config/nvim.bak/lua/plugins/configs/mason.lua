local M = {}

M.setup = function()
    -- Setup for mason.nvim
    require('mason').setup({})

    -- Setup for mason-lspconfig.nvim
    require('mason-lspconfig').setup({
        ensure_installed = { 'clangd', 'tsserver', 'gopls', 'pyright', 'rust_analyzer', 'html', 'lua_ls' } -- Add more servers here if needed
    })
end

return M
