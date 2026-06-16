return {
    "ahmedkhalf/project.nvim",
    event = "VeryLazy",
    config = function()
        require("project_nvim").setup({
            detection_methods = { "pattern" },
            patterns = { ".git", "_darcs", ".hg", ".bzr", ".svn", "Makefile", "package.json", "Cargo.toml" },
        })
        pcall(require('telescope').load_extension, 'projects')
    end,
    keys = {
        { "<leader>sp", "<cmd>Telescope projects<cr>", desc = "[S]earch [P]rojects" },
    },
}
