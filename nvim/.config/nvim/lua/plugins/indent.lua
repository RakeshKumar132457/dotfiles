return {
    {
        "lukas-reineke/indent-blankline.nvim",
        enabled = false,
        event = { "BufReadPost", "BufNewFile" },
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
        'tpope/vim-sleuth',
        event = { "BufReadPre", "BufNewFile" },
    }
}
