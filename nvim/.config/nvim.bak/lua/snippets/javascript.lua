-- ~/.config/nvim/lua/snippets/javascript_snippets.lua

local luasnip = require("luasnip")
local format = require("luasnip.extras.fmt").fmt

return {
    -- Console log snippet: A shorthand for console.log()
    luasnip.snippet('cl', format(
        [[
            console.log({});
        ]], { luasnip.insert_node(1) }
    )),

    -- Comment snippet: A template for a block comment
    luasnip.snippet('cmt', format(
        [[
            /**
             * {}
             */
        ]], { luasnip.insert_node(1) }
    )),
}
