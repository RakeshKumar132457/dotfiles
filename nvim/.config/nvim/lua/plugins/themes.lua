return {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    opts = {
        flavour = "mocha",
        transparent_background = false,
        integrations = {
            cmp = true,
            gitsigns = true,
            harpoon = true,
            indent_blankline = {
                enabled = true,
                colored_indent_levels = false,
            },
            mason = true,
            native_lsp = {
                enabled = true,
                underlines = {
                    errors = { "undercurl" },
                    hints = { "undercurl" },
                    warnings = { "undercurl" },
                    information = { "undercurl" },
                },
            },
            telescope = true,
            treesitter = true,
            which_key = true,
        },
    },
    init = function()
        vim.cmd.colorscheme("catppuccin")
    end,
}
