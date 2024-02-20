return {
    'akinsho/bufferline.nvim',
    event = {"UiEnter"},
    version = "*",
    dependencies = 'nvim-tree/nvim-web-devicons',
    config = function()
        require("bufferline").setup({})
    end

}
