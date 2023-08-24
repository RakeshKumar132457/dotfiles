-- core/init.lua

local safely_require = require('utils.safely_require').safely_require

local keybindings = safely_require('core.keybindings')
local options = safely_require('core.options')

return {
    keybindings = keybindings,
    options = options,
}
