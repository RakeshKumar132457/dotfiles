local indent_blankline_setting = {}

function indent_blankline_setting.setup()
    require("ibl").setup {
        indent = {
            char = '▏',
        },
        exclude = {
            filetypes = { 'help', 'packer', 'startify', 'NvimTree', 'alpha' },
            buftypes = { 'terminal', 'nofile', 'NvimTree', 'dashboard', 'alpha' },
        },
    }
end

return indent_blankline_setting
