vim.keymap.set('n', '<leader>ft', function()
    require('oil').toggle_float()
end, { desc = "[F]ile [T]ree " })

vim.keymap.set('n', '<leader>fb', function() vim.lsp.buf.format({ async = true }) end,
    { silent = true, desc = '[F]ormatting [B]uffer' })

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

vim.keymap.set({ 'n', 'v' }, '<leader>y', '"+y')

vim.keymap.set('n', '<leader>tt', '<Cmd>ToggleTerm<CR>', { desc = '[T]oggle [T]erm' })


vim.keymap.set('n', '<leader>ld', vim.lsp.buf.definition, { noremap = false, silent = true, desc = '[L]SP [D]efinition' })
vim.keymap.set('n', '<leader>ltd', vim.lsp.buf.type_definition,
    { noremap = false, silent = true, desc = '[L]SP [T]ype [D]efinition' })
vim.keymap.set('n', '<leader>lca', vim.lsp.buf.code_action,
    { noremap = false, silent = true, desc = '[L]SP [C]ode [A]ction' })
vim.keymap.set('n', '<leader>lr', vim.lsp.buf.references, { noremap = false, silent = true, desc = '[L]SP [R]eferences' })
vim.keymap.set('n', '<leader>laf', vim.lsp.buf.add_workspace_folder,
    { noremap = false, silent = true, desc = '[L]SP [A]dd [F]older' })
vim.keymap.set('n', '<leader>lrf', vim.lsp.buf.remove_workspace_folder,
    { noremap = false, silent = true, desc = '[L]SP [R]emove [F]older' })
vim.keymap.set('n', '<leader>lf', function() print(vim.inspect(vim.lsp.buf.list_workspace_folders())) end,
    { silent = true, noremap = true, desc = '[L]sp [F]olders' })
vim.keymap.set('n', '<leader>lrn', function() print(vim.inspect(vim.lsp.buf.rename())) end,
    { silent = true, noremap = true, desc = '[L]sp [R]e[Name]' })
