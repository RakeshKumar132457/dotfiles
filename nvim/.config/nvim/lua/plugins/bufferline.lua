return {
    'akinsho/bufferline.nvim',
    enabled = false,
    event = "VeryLazy",
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    opts = {
        options = {
            themable = true,
            numbers = "buffer_id",
            diagnostics = 'nvim_lsp',
            separator_style = { "|", "|" },
        },
    },
}
