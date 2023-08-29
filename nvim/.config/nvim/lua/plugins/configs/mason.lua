local M = {}

M.setup = function()
    -- Setup for mason.nvim
    require('mason').setup({})

    -- Setup for mason-lspconfig.nvim
    require('mason-lspconfig').setup({
        ensure_installed = { 'clangd' } -- Add more servers here if needed
    })
end

return M
