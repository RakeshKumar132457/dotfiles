return {
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
                enabled = false
            },
            exclude = {
                filetypes = { 'help', 'packer', 'startify', 'NvimTree', 'alpha', 'norg' },
                buftypes = { 'terminal', 'nofile', 'NvimTree', 'dashboard', 'alpha', 'norg' },
            },

        })
    end
}
