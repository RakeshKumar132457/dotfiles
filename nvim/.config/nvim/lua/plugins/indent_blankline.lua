return {
    "lukas-reineke/indent-blankline.nvim",
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
            }
        })
    end

}
