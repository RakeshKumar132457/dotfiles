return {
    'akinsho/toggleterm.nvim',
    cmd = { 'ToggleTerm', 'TermExec' },
    config = function()
        require('toggleterm').setup({
            persist_mode = true,
            winbar = {
                enabled = true,
            },
        })
    end
}
