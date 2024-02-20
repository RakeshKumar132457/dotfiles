return {
    'akinsho/toggleterm.nvim',
    cmd = "VimEnter",
    config = function()
        require('toggleterm').setup({})
    end
}
