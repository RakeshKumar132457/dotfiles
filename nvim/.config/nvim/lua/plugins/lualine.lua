return {
    'nvim-lualine/lualine.nvim',
    event = { "BufReadPost" },
    -- enabled = false,
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
        require('lualine').setup({})
    end
}
