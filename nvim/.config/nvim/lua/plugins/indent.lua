return {
    {
        "lukas-reineke/indent-blankline.nvim",
        -- enabled = false,
        event = 'BufEnter',
        lazy = true,
        config = function()
            require('ibl').setup({
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
            })
        end
    },
    {
        'nmac427/guess-indent.nvim',
        config = function()
            require('guess-indent').setup({})
        end,
    }
}
