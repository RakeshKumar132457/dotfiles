return {
    'akinsho/bufferline.nvim',
    event = { "BufReadPost" },
    version = "*",
    dependencies = 'nvim-tree/nvim-web-devicons',
    config = function()
        require("bufferline").setup({
            options = {
                themable = true,
                numbers = "buffer_id",
                diagnostics = 'nvim_lsp',
                separator_style = {"|", "|"}
            },
        })
    end,
    enabled = false
}
