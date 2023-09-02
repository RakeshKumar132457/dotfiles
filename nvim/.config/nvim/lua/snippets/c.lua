local luasnip = require("luasnip")
local format = require('luasnip.extras.fmt').fmt
local repeat_node = require('luasnip.extras').rep


return {
    -- Init snippet: A template for a basic C++ program structure
    luasnip.snippet('init', format(
        [==[
            #include <stdio.h>

            int main(){{
                {}

                return 0;
            }}
        ]==], { luasnip.insert_node(1) }
    )),

    luasnip.snippet('cmt', format(
        [[
            /**
             * {}
             */
        ]], { luasnip.insert_node(1) }
    )),

}
