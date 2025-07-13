return {
    "kylechui/nvim-surround",
    keys = {
        { "ys" },
        { "yss" },
        { "ds" },
        { "cs" },
        { "S",  mode = "v" },
    },
    config = function()
        require("nvim-surround").setup({
            move_cursor = "sticky"
        })
    end
}
