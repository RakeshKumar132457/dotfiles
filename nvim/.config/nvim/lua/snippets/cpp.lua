-- ~/.config/nvim/lua/snippets/cpp_snippets.lua

local luasnip = require("luasnip")
local fmt = require("luasnip.extras.fmt").fmt

return {
    -- Init snippet: A template for a basic C++ program structure
    luasnip.snippet('basic_structure', {
        luasnip.insert_node(1, "code_inside_main")
    }),

    -- Comment snippet: A template for a block comment
    luasnip.snippet('block_comment', {
        luasnip.insert_node(1, "comment_content")
    }),

    -- Object creation snippet: A shorthand for creating a new object using dynamic memory
    luasnip.snippet('dynamic_object_creation', fmt(
        [[
            {1} *{2} = new {3}();
        ]], {
            luasnip.insert_node(1, "object_type"),
            luasnip.insert_node(2, "object_name"),
            luasnip.insert_node(3, "constructor_arguments")
        }
    )),

    -- Debug macro snippet: A macro for debugging variables
    luasnip.snippet('debug_macro', fmt(
        [[
        #define dbg(v) \
            cout << "Line(" << __LINE__ << ") -> " << #v << " = " << (v) << endl;
        ]], {}
    )),

    -- File input-output snippet: A shorthand for reading from and writing to files
    luasnip.snippet('file_io', fmt(
        [[
            ifstream fin("input.txt");
            ofstream fout("output.txt");
        ]], {}
    )),

    -- Test case array processing snippet: A template for reading test cases from a file and processing them
    luasnip.snippet('test_case_array_processing', fmt(
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
