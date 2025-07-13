local M = {}

M.setup = function()
    local map = vim.keymap.set
    map({ 'n', 'v' }, '<leader>y', '"+y', { desc = "Yank to system clipboard" })
    map('n', '<leader>cr', ':lua require"utils.runner".run()<CR>', { desc = "[C]ode [R]unner" })
end

return M
