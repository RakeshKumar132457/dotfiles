return {
    {
        "lukas-reineke/indent-blankline.nvim",
        enabled = false,                         -- Keep it disabled as per your current setup
        event = { "BufReadPost", "BufNewFile" }, -- More specific than 'BufEnter'
        opts = {
            indent = {
                char = '▏',
                tab_char = '▏',
            },
            scope = {
                enabled = true
            },
            exclude = {
                filetypes = { 'help', 'packer', 'startify', 'NvimTree', 'alpha', 'norg' },
                buftypes = { 'terminal', 'nofile', 'NvimTree', 'dashboard', 'alpha', 'norg' },
            },
        },
    },
    {
        'nmac427/guess-indent.nvim',
        event = { "BufReadPost", "BufNewFile" },
        opts = {}, -- Use empty table for default options
        enabled = false
    },
    {
        'tpope/vim-sleuth',
        event = { "BufReadPre", "BufNewFile" },
    }
}
