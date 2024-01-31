-- ~/.config/nvim/lua/snippets/cpp_snippets.lua

local luasnip = require("luasnip")
local format = require('luasnip.extras.fmt').fmt
local repeat_node = require('luasnip.extras').rep


return {
    -- Init snippet: A template for a basic C++ program structure
    luasnip.snippet('init', format(
        [==[
            #include <bits/stdc++.h>

            using namespace std;

            int main(){{
                ios_base::sync_with_stdio(false);
                cin.tie(nullptr);

                {}

                return 0;
            }}
        ]==], { luasnip.insert_node(1) }
    )),

    -- Comment snippet: A template for a block comment
    luasnip.snippet('cmt', format(
        [[
            /**
             * {}
             */
        ]], { luasnip.insert_node(1) }
    )),

    -- Object creation snippet: A shorthand for creating a new object using dynamic memory
    luasnip.snippet('obj', format(
        [[
            {1} *{2}= new {3}();
        ]], { luasnip.insert_node(1), luasnip.insert_node(2), repeat_node(1) }
    )),

    -- Debug macro snippet: A macro for debugging variables
    luasnip.snippet('debug', format(
        [[
        #define dbg(v) \
            cout << "Line(" << __LINE__ << ") -> " << #v << " = " << (v) << endl;
        ]], {}
    )),

    -- File input-output snippet: A shorthand for reading from and writing to files
    luasnip.snippet('inp', format(
        [[
            ifstream fin("input.txt");
            ofstream fout("output.txt");
        ]], {}
    )),

    -- Test case array processing snippet: A template for reading test cases from a file and processing them
    luasnip.snippet('tcarr', format(
        [[
            string fileLine;
            while (getline(fin, fileLine)) {{
                stringstream strStream(fileLine);
                int singleNum;
                vector<int> inputArray;
                while (strStream >> singleNum) {{
                    inputArray.push_back(singleNum);
                }}
                fout << {} << endl;
            }}
        ]], {
            luasnip.insert_node(1, "processing_code")
        }
    ))
}
