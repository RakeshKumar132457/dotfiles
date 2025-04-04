local luasnip = require("luasnip")
local format = require("luasnip.extras.fmt").fmt

return {
    luasnip.snippet('clc', format([[
        console.log('\\x1b[31m\\x1b[42m%s\\x1b[0m', JSON.stringify({}));
    ]], { luasnip.insert_node(1) })),

    luasnip.snippet('cmt', format(
        [[
            /**
             * {}
             */
        ]], { luasnip.insert_node(1) }
    )),
}
