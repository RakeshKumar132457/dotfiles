return {
    "folke/trouble.nvim",
    cmd = { "Trouble", "TroubleToggle" }, -- Lazy load only on these commands
    dependencies = { "nvim-tree/nvim-web-devicons" }, -- Ensure you have the devicons
    opts = {
        position = "bottom", -- Can be "bottom", "top", "left", or "right"
        height = 10, -- Height of the trouble window
        icons = true, -- Use devicons for icons
        mode = "workspace_diagnostics", -- Default mode (options: "workspace_diagnostics", "document_diagnostics", "quickfix", "lsp_references", "loclist")
        fold_open = "", -- Icon for open folds
        fold_closed = "", -- Icon for closed folds
        group = true, -- Group results by file
        padding = true, -- Add an extra new line on top of the list
        action_keys = { -- Key mappings for actions in the trouble list
            close = "q", -- Close the list
            refresh = "r", -- Refresh the list manually
            jump = { "<cr>", "<tab>" }, -- Jump to the diagnostic or open file
        },
        auto_open = false, -- Automatically open trouble when there are diagnostics
        auto_close = true, -- Automatically close trouble when there are no diagnostics
        auto_preview = false, -- Disable automatic preview
        signs = {
            error = "",
            warning = "",
            hint = "",
            information = ""
        },
        use_diagnostic_signs = true -- Use signs defined in your LSP client
    },
    keys = {
        {
            "<leader>xx",
            "<cmd>TroubleToggle diagnostics<cr>",
            desc = "Diagnostics (Trouble)"
        },
        {
            "<leader>xX",
            "<cmd>TroubleToggle diagnostics<cr>",
            desc = "Buffer Diagnostics (Trouble)",
            mode = "n",
            opts = { filter = { buf = 0 } }
        },
        {
            "<leader>cs",
            "<cmd>TroubleToggle symbols<cr>",
            desc = "Symbols (Trouble)"
        },
        {
            "<leader>cl",
            "<cmd>TroubleToggle lsp_references<cr>",
            desc = "LSP Definitions/References (Trouble)"
        },
        {
            "<leader>xL",
            "<cmd>TroubleToggle loclist<cr>",
            desc = "Location List (Trouble)"
        },
        {
            "<leader>xQ",
            "<cmd>TroubleToggle quickfix<cr>",
            desc = "Quickfix List (Trouble)"
        },
    },
}
