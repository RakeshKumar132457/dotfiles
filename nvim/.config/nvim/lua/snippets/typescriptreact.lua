local luasnip = require("luasnip")
local format = require("luasnip.extras.fmt").fmt

return {
    -- Console log snippet: A shorthand for console.log()
    luasnip.snippet('cl', format(
        [[
            console.log({});
        ]], { luasnip.insert_node(1) }
    )),

    luasnip.snippet('clc', format([[
        console.log(`%c{}`, `{}`);
    ]], {
        luasnip.insert_node(1, "Your message here..."),                  -- Placeholder for the log message
        luasnip.insert_node(2, "color: red; background-color: yellow;"), -- Placeholder for CSS styles
    })),




    -- Comment snippet: A template for a block comment
    luasnip.snippet('cmt', format(
        [[
            /**
             * {}
             */
        ]], { luasnip.insert_node(1) }
    )),
}
