return {
    {
        'lewis6991/gitsigns.nvim',
        event = 'BufReadPost',
        config = function()
            require('gitsigns').setup({})
        end
    },
    {
        "sindrets/diffview.nvim",
        cmd = { 'DiffviewOpen', 'DiffviewLog', 'DiffviewFileHistory', 'DiffviewFocusFiles', 'DiffviewClose',
            'DiffviewToggleFiles' },
    },
    {
        "NeogitOrg/neogit",
        cmd = {"Neogit"},
        dependencies = {
            "nvim-lua/plenary.nvim",
            "sindrets/diffview.nvim",

            "nvim-telescope/telescope.nvim",
        },
        config = true
    }

}
