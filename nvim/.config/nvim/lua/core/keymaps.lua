-- Utilities
vim.keymap.set('n', '<leader>ft', function()
    require('oil').toggle_float()
end, { desc = "[F]ile [T]ree " })
vim.keymap.set({ 'n', 'v' }, '<leader>y', '"+y')
vim.keymap.set('n', '<leader>tt', '<Cmd>ToggleTerm<CR>', { desc = '[T]oggle [T]erm' })
vim.keymap.set('n', '<leader>tn',
    function()
        local Terminal = require("toggleterm.terminal").Terminal
        local new_term = Terminal:new({})
        new_term:open()
    end, { desc = '[T]erminal [N]ew' })
vim.keymap.set('n', '<leader>lg', function()
    local Terminal = require('toggleterm.terminal').Terminal
    local lazygit = Terminal:new({ cmd = "lazygit", hidden = true, direction = 'float' })
    lazygit:toggle()
end, { desc = '[L]azy [G]it' })


-- Telescope
vim.keymap.set('n', '<leader>sf', function()
    require('telescope.builtin').find_files()
end, { desc = '[S]earch [F]iles' })

vim.keymap.set('n', '<leader>sg', function()
    require('telescope.builtin').live_grep()
end, { desc = '[S]earch by [G]rep' })

vim.keymap.set('n', '<leader>ss', function()
    require('telescope.builtin').lsp_document_symbols()
end, { desc = '[S]earch LSP [S]ymbols' })

vim.keymap.set('n', '<leader>sb', function()
    require('telescope.builtin').buffers()
end, { desc = '[S]earch [B]uffers' })

vim.keymap.set('n', '<leader>sd', function()
    require('telescope.builtin').diagnostics()
end, { desc = '[S]earch [D]iagonstics' })

vim.keymap.set('n', '<leader>sr', function()
    require('telescope.builtin').oldfiles()
end, { desc = '[S]earch [R]ecent files' })

vim.keymap.set('n', '<leader>sk', function()
    require('telescope.builtin').keymaps()
end, { desc = '[S]earch [K]eymaps' })

vim.keymap.set('n', '<leader>ut', function()
    require('telescope').extensions.undo.undo()
end, { desc = '[U]ndo [T]ree' })

vim.keymap.set('n', '<leader>ut', function()
    require('telescope').extensions.undo.undo()
end, { desc = '[U]ndo [T]ree' })

vim.keymap.set('n', '<leader>cr', ':lua require"utils.runner".run()<CR>')
