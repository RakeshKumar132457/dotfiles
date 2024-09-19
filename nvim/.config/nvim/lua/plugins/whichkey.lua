return {
    "folke/which-key.nvim",
    event = "VeryLazy", -- Lazy load to improve startup time
    config = function()
        require('which-key').setup({
            plugins = {
                spelling = {
                    enabled = true,   -- Enable spelling suggestions
                    suggestions = 20, -- Show 20 suggestions
                },
            },
            replace = {
                ["<leader>"] = "SPC", -- Replace <leader> with SPC
                ["<cr>"] = "RET",     -- Replace <cr> with RET
                ["<tab>"] = "TAB",    -- Replace <tab> with TAB
            },
            layout = {
                spacing = 6, -- Set spacing between columns
            },
        })
    end,
}
