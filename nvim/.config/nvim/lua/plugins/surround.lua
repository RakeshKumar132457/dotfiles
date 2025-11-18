return {
    "kylechui/nvim-surround",
    event = "VeryLazy",
    keys = {
        { "ys" }, { "yss" }, { "ds" }, { "cs" },
        { "S", mode = "v" },
    },
    config = function()
        require("nvim-surround").setup({
            move_cursor = "sticky"
        })
    end
}
