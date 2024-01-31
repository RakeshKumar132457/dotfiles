local CONSTANTS = require('utils.constants')

local M = {}

function M.error_msg(file_name, dir_name)
    local file_path
    if dir_name == 'config' then
        file_path = vim.api.nvim_call_function("expand", { CONSTANTS.PATHS.PLUGIN_CONFIG .. file_name })
    elseif dir_name == 'lua' then
        file_path = vim.api.nvim_call_function("expand", { CONSTANTS.PATHS.LUA_CONFIG .. file_name })
    else
        error('Enter a valid dir name')
    end
    return "Problem loading " .. file_path .. " ..."
end

return M

