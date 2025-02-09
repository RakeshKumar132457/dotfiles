local luasnip = require("luasnip")
local format = require('luasnip.extras.fmt').fmt
local repeat_node = require('luasnip.extras').rep


return {
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

    luasnip.snippet('cmt', format(
        [[
            /**
             * {}
             */
        ]], { luasnip.insert_node(1) }
    )),

    luasnip.snippet('obj', format(
        [[
            {1} *{2}= new {3}();
        ]], { luasnip.insert_node(1), luasnip.insert_node(2), repeat_node(1) }
    )),

    luasnip.snippet('debug', format(
        [[
        #define dbg(v) \
            cout << "Line(" << __LINE__ << ") -> " << #v << " = " << (v) << endl;
        ]], {}
    )),

    luasnip.snippet('inp', format(
        [[
            ifstream fin("input.txt");
            ofstream fout("output.txt");
        ]], {}
    )),

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
