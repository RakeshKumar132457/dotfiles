-- ~/.config/nvim/lua/plugins/config/luasnip.lua

-- Safely require the Luasnip module
local safely_require = require('utils.safely_require').safely_require
local luasnip = safely_require('luasnip')

-- Exit the configuration if Luasnip isn't available
if not luasnip then
    return
end

-- Import Luasnip Utilities
local create_snippet = luasnip.snippet
local format_snippet = require("luasnip.extras.fmt").fmt

-- Luasnip Keybindings Setup
-- Keybinding for expanding or jumping to the next placeholder
vim.keymap.set({ "i", "s" }, "<c-k>", function()
    if luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
    end
end, { silent = true })

-- Keybinding for jumping to the previous placeholder
vim.keymap.set({ "i", "s" }, "<c-j>", function()
    if luasnip.jumpable(-1) then
        luasnip.jump(-1)
    end
end, { silent = true })

-- Keybinding for changing choices within snippets
vim.keymap.set({ "i", "s" }, "<c-l>", function()
    if luasnip.choice_active() then
        luasnip.change_choice(1)
    end
end, { silent = true })

-- Basic Luasnip Configuration
luasnip.config.set_config {
    history = true,                            -- Remember the last selected choice in a snippet
    delete_check_events = 'TextChanged',       -- Check for deletion of snippet nodes on text change
    updateevents = 'TextChanged,TextChangedI', -- Update active nodes on text change
    enable_autosnippets = true,                -- Enable auto-expansion of snippets
    store_selection_keys = "",                 -- Key combination to store the current selection
}

-- Load the snippets from the dedicated snippets directory
require("snippets.loader")

return {}
