return {
    {
        'lewis6991/gitsigns.nvim',
        event = 'BufReadPost',
        config = function()
            local gitsigns = require('gitsigns');

            gitsigns.setup({
                current_line_blame = true
            })

            vim.keymap.set("n", "<leader>hp", function() gitsigns.preview_hunk_inline() end,
                { desc = "[H]unk [P]review " })

            vim.keymap.set("n", "<leader>hs", function() gitsigns.stage_hunk() end,
                { desc = "[H]unk [S]tage " })

            vim.keymap.set("n", "<leader>hr", function() gitsigns.reset_hunk() end,
                { desc = "[H]unk [R]eset " })

            vim.keymap.set("n", "<leader>hu", function() gitsigns.undo_stage_hunk() end,
                { desc = "[H]unk [U]ndo" })
        end
    },
    {
        "sindrets/diffview.nvim",
        cmd = { 'DiffviewOpen', 'DiffviewLog', 'DiffviewFileHistory', 'DiffviewFocusFiles', 'DiffviewClose',
            'DiffviewToggleFiles' },
    },
    {
        "NeogitOrg/neogit",
        cmd = { "Neogit" },
        dependencies = {
            "nvim-lua/plenary.nvim",
            "sindrets/diffview.nvim",

            "nvim-telescope/telescope.nvim",
        },
        config = true
    }

}
