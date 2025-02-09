local M = {}

M.setup = function(opts)
    require('core.options').setup()
    require('core.lazy').setup()
    require('core.keymaps').setup()
end

return M
