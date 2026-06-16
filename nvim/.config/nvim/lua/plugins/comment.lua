return {
    "numToStr/Comment.nvim",
    enabled = false, -- Disabled: Built-in commenting is now supported in Neovim 0.10+ (via gc/gb)
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
