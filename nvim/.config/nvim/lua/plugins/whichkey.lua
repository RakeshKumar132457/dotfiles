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
            win = {
                border = "single",        -- Use single border for the window
                position = "bottom",      -- Position the popup at the bottom
                margin = { 1, 0, 1, 0 },  -- Set window margins
                padding = { 2, 2, 2, 2 }, -- Set padding inside the window
            },
            layout = {
                spacing = 6,       -- Set spacing between columns
            },
            triggers = { "auto" }, -- Automatically trigger which-key
        })
    end,
}
