local luasnip = require("luasnip")

return {
    -- Ternary snippet: Provides a quick template for ternary operations
    luasnip.snippet("ternary", {
        luasnip.insert_node(1, "condition"),
        luasnip.text_node(" ? "),
        luasnip.insert_node(2, "true_value"),
        luasnip.text_node(" : "),
        luasnip.insert_node(3, "false_value")
    }),

    -- Curtime snippet: Inserts the current date and time
    luasnip.snippet('curtime', {
        luasnip.function_node(function()
            return os.date "%D - %H:%M"
        end)
    })
}
