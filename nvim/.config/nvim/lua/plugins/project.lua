return {
    "ahmedkhalf/project.nvim",
    event = "VeryLazy",
    opts = {
        show_hidden = true,
        scope_chdir = 'win',
        silent_chdir = true,
        datapath = vim.fn.stdpath("data"),
    },
    config = function(_, opts)
        require("project_nvim").setup(opts)
    end,
    keys = {
        {
            "<leader>fp",
            function()
                vim.defer_fn(function()
                    local ok, telescope = pcall(require, "telescope")
                    if ok then
                        telescope.load_extension("projects")
                        telescope.extensions.projects.projects {}
                    else
                        vim.notify("Telescope is not available", vim.log.levels.WARN)
                    end
                end, 10)
            end,
            desc = "Find Project"
        },
    },
}
