return {
    'stevearc/dressing.nvim',
    event = "VeryLazy",
    enabled = false,
    opts = {
        input = {
            enabled = true,
            default_prompt = "Input:",
            prompt_align = "left",
            insert_only = true,
            start_in_insert = true,
            border = "rounded",
            relative = "cursor",
            prefer_width = 40,
            width = nil,
            max_width = { 140, 0.9 },
            min_width = { 20, 0.2 },
            win_options = {
                winblend = 0,
                winhighlight = "Normal:Normal,NormalNC:Normal",
            },
            mappings = {
                n = {
                    ["<Esc>"] = "Close",
                    ["<CR>"] = "Confirm",
                },
                i = {
                    ["<C-c>"] = "Close",
                    ["<CR>"] = "Confirm",
                    ["<Up>"] = "HistoryPrev",
                    ["<Down>"] = "HistoryNext",
                },
            },
        },
        select = {
            enabled = true,
            backend = { "telescope", "fzf", "builtin" },
            trim_prompt = true,
            telescope = nil,
            fzf = {
                window = {
                    width = 0.5,
                    height = 0.4,
                },
            },
            builtin = {
                border = "rounded",
                relative = "editor",
                win_options = {
                    winblend = 0,
                    winhighlight = "Normal:Normal,NormalNC:Normal",
                },
                mappings = {
                    ["<Esc>"] = "Close",
                    ["<C-c>"] = "Close",
                    ["<CR>"] = "Confirm",
                },
            },
        },
    },
}
