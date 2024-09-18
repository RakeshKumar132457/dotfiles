return {
    'Bekaboo/dropbar.nvim',
    enabled = false, -- Set to true when you want to enable
    event = "VeryLazy",
    opts = {
        menu = {
            -- Disable keymaps to save on initialization time
            keymaps = {
                close = {},
                hover = {},
                toggle_entry_expand = {},
            },
        },
        -- Disable general keymaps to reduce overhead
        general = {
            enable = false,
        },
        icons = {
            enable = false,           -- Disable icons for performance, enable if needed
            kinds = {
                use_devicons = false, -- Disable devicons for performance
            },
        },
        sources = {
            path = {
                enabled = false, -- Disable path source for performance
            },
            treesitter = {
                enabled = true,
                namespaces = { -- Specify only the namespaces you need
                    "function",
                    "method",
                    "type",
                },
            },
            lsp = {
                enabled = true,
            },
        },
    },
    dependencies = {
        'nvim-telescope/telescope-fzf-native.nvim',
    },
}

