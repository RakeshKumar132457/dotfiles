return {
    "stevearc/oil.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" }, -- Load icons when necessary
    cmd = "Oil",                                      -- Lazy load Oil on command
    keys = {
        {
            "<leader>ft", -- Keybinding to toggle Oil floating file explorer
            function() require("oil").toggle_float() end,
            desc = "[F]ile [T]ree (Toggle Floating)",
            noremap = true,
            silent = true
        },

    },
    config = function()
        require('oil').setup({
            default_file_explorer = true, -- Use Oil as the default file explorer
            columns = { "icon", "size" }, -- Display only icon and size columns
            delete_to_trash = true,       -- Move deleted files to trash
            view_options = {
                show_hidden = true,       -- Option to show hidden files
            },
            keymaps = {
                -- Add actions for manipulating files
                ["<leader>fr"] = { require("oil.actions").rename, desc = "[F]ile [R]ename" },
                ["<leader>fc"] = { require("oil.actions").copy, desc = "[F]ile [C]opy" },
                ["<leader>fm"] = { require("oil.actions").move, desc = "[F]ile [M]ove" },
            },
        })
    end
}
