local luasnip = require("luasnip")

return {
    luasnip.snippet("ternary", {
        luasnip.insert_node(1, "condition"),
        luasnip.text_node(" ? "),
        luasnip.insert_node(2, "true_value"),
        luasnip.text_node(" : "),
        luasnip.insert_node(3, "false_value")
    }),

    luasnip.snippet('curdate', {
        luasnip.function_node(function()
            return os.date "%D"
        end)
    }),

    luasnip.snippet('curtime', {
        luasnip.function_node(function()
            return os.date "%H:%M"
        end)
    })
}
