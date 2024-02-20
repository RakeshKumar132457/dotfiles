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
        require('telescope').setup({
            defaults = {
                prompt_prefix = ' 🔍 ',
                selection_caret = ' ',
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
