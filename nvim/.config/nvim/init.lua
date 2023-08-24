-- ~/.config/nvim/init.lua

-- Import the safely_require function from utils
local safely_require = require('utils').safely_require

-- Load plugins
local plugins_module = safely_require('plugins')

-- Check if plugins_module loaded successfully
if plugins_module then
    local plugins = plugins_module.plugins_list
    local plugin_options = plugins_module.lazy_options

    -- Setup lazy.nvim
    if plugins and plugin_options then
        require("lazy").setup(plugins, plugin_options)
    end
else
    print("Warning: Failed to load plugins module.")
end

-- Load core and lsp configurations
local core_status = safely_require('core')
if not core_status then
    print("Warning: Failed to load core module.")
end

local lsp_status = safely_require('lsp')
if not lsp_status then
    print("Warning: Failed to load lsp module.")
end
