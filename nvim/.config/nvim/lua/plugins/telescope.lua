return {
    "nvim-telescope/telescope.nvim",
    cmd = { "Telescope" },
    -- event = { "VeryLazy" },
    dependencies = {
        "nvim-lua/plenary.nvim",
        "debugloop/telescope-undo.nvim",
        {
            "nvim-telescope/telescope-fzf-native.nvim",
            build =
            "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build",
            cond = vim.fn.executable("cmake") == 1,
        }
    },
    config = function()
        local action_layout = require("telescope.actions.layout")
        require('telescope').setup({
            defaults = {
                prompt_prefix = ' ',
                selection_caret = ' ',
                vimgrep_arguments = {
                    "rg",
                    "--color=never",
                    "--no-heading",
                    "--with-filename",
                    "--line-number",
                    "--column",
                    "--smart-case",
                    "--trim"
                },
                mappings = {
                    n = {
                        ["<M-p>"] = action_layout.toggle_preview
                    },
                    i = {
                        ["<M-p>"] = action_layout.toggle_preview,
                    },
                },
            },
            pickers = {
                find_files = {
                    hidden = true,
                }
            },
        })
        require('telescope').load_extension('projects')
        require('telescope').load_extension('undo')
    end
}
