-- ~/.config/nvim/lua/snippets/javascript_snippets.lua

local luasnip = require("luasnip")

return {
    -- Console log snippet: A shorthand for console.log()
    luasnip.snippet('console_log', {
        luasnip.insert_node(1, "value_to_log")
    })
}
