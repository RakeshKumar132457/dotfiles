-- ~/.config/nvim/lua/snippets/loader.lua

-- Import the Luasnip module
local safely_require = require('utils.safely_require').safely_require
local luasnip = safely_require("luasnip")

-- Exit the configuration if Luasnip isn't available
if not luasnip then
    return
end

local function load_snippets_from_directory()
    -- Define the directory where snippet files are located
    local snippets_directory = vim.fn.stdpath("config") .. "/lua/snippets/"

    -- Get a list of all Lua files within the snippets directory
    local snippet_files = vim.fn.glob(snippets_directory .. "*.lua", false, true)

    -- Iterate over each snippet file and load its snippets into Luasnip
    for _, snippet_file_path in ipairs(snippet_files) do
        -- Extract the filetype from the filename (without extension)
        local filetype = vim.fn.fnamemodify(snippet_file_path, ":t:r")

        -- Skip the loader.lua file to prevent recursion
        if filetype ~= "loader" then
            -- Load the snippets from the file
            local snippets_for_filetype = dofile(snippet_file_path)

            -- Add the loaded snippets to Luasnip using the add_snippets function
            luasnip.add_snippets(filetype, snippets_for_filetype)

            -- Special case: if the filetype is "javascript", also add the snippets to other related filetypes
            if filetype == "javascript" then
                local related_filetypes = {
                    "javascriptreact",
                    "javascript.jsx",
                    "typescript",
                    "typescriptreact",
                    "typescript.tsx"
                }

                for _, related_filetype in ipairs(related_filetypes) do
                    luasnip.add_snippets(related_filetype, snippets_for_filetype)
                end
            end
        end
    end
end


-- Invoke the function to load snippets
load_snippets_from_directory()
