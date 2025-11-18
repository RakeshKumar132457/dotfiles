local M = {}

M.setup = function()
    local map = vim.keymap.set

    -- Existing
    map({ 'n', 'v' }, '<leader>y', '"+y', { desc = "Yank to system clipboard" })
    map('n', '<leader>cr', ':lua require"utils.runner".run()<CR>', { desc = "[C]ode [R]unner" })

    -- Recommended additions
    map('n', '<Esc>', '<cmd>nohlsearch<CR>', { desc = "Clear search highlights" })
    map('n', '<leader>q', '<cmd>qa<CR>', { desc = "Quit all" })

    -- Better window navigation
    map('n', '<C-h>', '<C-w>h', { desc = "Go to left window" })
    map('n', '<C-j>', '<C-w>j', { desc = "Go to lower window" })
    map('n', '<C-k>', '<C-w>k', { desc = "Go to upper window" })
    map('n', '<C-l>', '<C-w>l', { desc = "Go to right window" })

    -- Resize windows
    map('n', '<C-Up>', '<cmd>resize +2<CR>', { desc = "Increase window height" })
    map('n', '<C-Down>', '<cmd>resize -2<CR>', { desc = "Decrease window height" })
    map('n', '<C-Left>', '<cmd>vertical resize -2<CR>', { desc = "Decrease window width" })
    map('n', '<C-Right>', '<cmd>vertical resize +2<CR>', { desc = "Increase window width" })

    -- Better indenting
    map('v', '<', '<gv', { desc = "Indent left" })
    map('v', '>', '>gv', { desc = "Indent right" })

    -- Move lines
    map('n', '<A-j>', '<cmd>m .+1<CR>==', { desc = "Move line down" })
    map('n', '<A-k>', '<cmd>m .-2<CR>==', { desc = "Move line up" })
    map('v', '<A-j>', ":m '>+1<CR>gv=gv", { desc = "Move selection down" })
    map('v', '<A-k>', ":m '<-2<CR>gv=gv", { desc = "Move selection up" })
end

return M
