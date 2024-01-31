return {
    "nvim-telescope/telescope.nvim",
    cmd = { "Telescope" },
    dependencies = {
        "nvim-lua/plenary.nvim",
        {
            "nvim-telescope/telescope-fzf-native.nvim",
            build =
            "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build",
            cond = vim.fn.executable("cmake") == 1,
        }
    },
    config = function()
        require('telescope').setup({})
    end
}
