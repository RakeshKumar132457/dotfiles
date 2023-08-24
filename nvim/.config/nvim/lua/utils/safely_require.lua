local M = {}

function M.safely_require(module)
    local status, result = pcall(require, module)
    if not status then
        return nil, result
    end
    return result
end

return M
