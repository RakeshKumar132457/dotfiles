return {
    'nvim-lualine/lualine.nvim',
    event = "UiEnter",
    -- enabled = false,
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function ()
        require('lualine').setup({})
    end
}
