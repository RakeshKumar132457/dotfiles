vim.keymap.set('n', '<leader>t', function()
    require('oil').toggle_float()
end)

vim.keymap.set('n', '<leader>f', function() vim.lsp.buf.format({ async = true }) end,
    { silent = true, desc = 'Formatting buffer' })
