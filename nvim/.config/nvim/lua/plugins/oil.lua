return {
    "stevearc/oil.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    cmd = "Oil",
    config = function()
        require('oil').setup({
            default_file_explorer = true,
            columns = {
                "icon",
                "size",
            },
        })
    end
}
