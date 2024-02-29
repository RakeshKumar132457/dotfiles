vim.keymap.set('n', '<leader>ft', function()
    require('oil').toggle_float()
end, { desc = "[F]ile [T]ree " })
vim.keymap.set({ 'n', 'v' }, '<leader>y', '"+y')
vim.keymap.set('n', '<leader>tt', '<Cmd>ToggleTerm<CR>', { desc = '[T]oggle [T]erm' })

-- Trouble
vim.keymap.set("n", "<leader>xx", function() require("trouble").toggle() end, { desc = "Toggle Trouble" })
vim.keymap.set("n", "<leader>xw", function() require("trouble").toggle("workspace_diagnostics") end,
    { desc = "Toggle Workspace Diagnostics" })
vim.keymap.set("n", "<leader>xd", function() require("trouble").toggle("document_diagnostics") end,
    { desc = "Toggle Document Diagnostics" })
vim.keymap.set("n", "<leader>xq", function() require("trouble").toggle("quickfix") end,
    { desc = "Toggle Quickfix" })
vim.keymap.set("n", "<leader>xl", function() require("trouble").toggle("loclist") end,
    { desc = "Toggle Location List" })
vim.keymap.set("n", "gR", function() require("trouble").toggle("lsp_references") end,
    { desc = "Toggle LSP References" })

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
