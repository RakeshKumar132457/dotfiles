return {
    "lukas-reineke/indent-blankline.nvim",
    enabled = false,
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
            }
        })
    end
}
