return {
    "ahmedkhalf/project.nvim",
    config = function()
        require("project_nvim").setup({
            show_hiddden = true,
            scope_chdir = 'win'
        })
    end
}
