return {
    'akinsho/toggleterm.nvim',
    cmd = 'ToggleTerm',
    config = function()
        require('toggleterm').setup({
            persist_mode = true,
            winbar = {
                enabled = true,
                name_formatter = function(term)
                    return term.name
                end
            },
        })
    end
}
