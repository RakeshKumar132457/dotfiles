return {
    "folke/which-key.nvim",
    event = "VeryLazy",
    config = function()
        require('which-key').setup({
            plugins = {
                spelling = {
                    enabled = true,
                    suggestions = 20,
                },
            },
            replace = {
                ["<leader>"] = "SPC",
                ["<cr>"] = "RET",
                ["<tab>"] = "TAB",
            },
            layout = {
                spacing = 6,
            },
        })
    end,
}
