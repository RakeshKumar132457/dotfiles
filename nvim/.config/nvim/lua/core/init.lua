local M = {}

M.setup = function()
    require('core.options').setup()
    require('core.lazy').setup()
    require('core.keymaps').setup()
    require('core.autocmds').setup()
end

return M
