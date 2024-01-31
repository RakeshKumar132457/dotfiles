-- plugins/init.lua

-- Load plugin modules
local lazy_options = require('plugins.lazy_options')
local plugins_list = require('plugins.plugins')

return {
    lazy_options = lazy_options,
    plugins_list = plugins_list
}
