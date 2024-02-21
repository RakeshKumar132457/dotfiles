return {
    'akinsho/bufferline.nvim',
    event = { "BufReadPost" },
    version = "*",
    dependencies = 'nvim-tree/nvim-web-devicons',
    config = function()
        require("bufferline").setup({})
    end

}
