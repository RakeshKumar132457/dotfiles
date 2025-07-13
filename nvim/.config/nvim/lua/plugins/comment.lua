return {
    "numToStr/Comment.nvim",
    keys = {
        { "gc", mode = { "n", "v" }, desc = "Comment toggle linewise" },
        { "gb", mode = { "n", "v" }, desc = "Comment toggle blockwise" },
    },

    dependencies = {
        'JoosepAlviste/nvim-ts-context-commentstring'
    },
    config = function()
        require("Comment").setup({
            pre_hook = function()
                return vim.bo.commentstring
            end
        })
    end,
}
