return {
    "stevearc/oil.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    cmd = "Oil",
    keys = {
        {
            "<leader>ft",
            function() require("oil").toggle_float() end,
            desc = "[F]ile [T]ree (Toggle Floating)",
            noremap = true,
            silent = true
        },

    },
    config = function()
        require('oil').setup({
            default_file_explorer = true,
            columns = { "icon", "size" },
            delete_to_trash = true,
            view_options = {
                show_hidden = true,
            },
        })
    end
}
