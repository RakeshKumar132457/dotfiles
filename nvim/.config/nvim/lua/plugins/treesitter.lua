return {
    {
        'nvim-treesitter/nvim-treesitter',
        event = { "BufWinEnter", "BufNewFile" },
        build = ":TSUpdate",
        dependencies = {
            { 'nvim-treesitter/nvim-treesitter-textobjects', event = "VeryLazy" },
        },
        cmd = { "TSInstall", "TSBufEnable", "TSBufDisable", "TSModuleInfo" },
        config = function()
            require('nvim-treesitter.configs').setup({
                sync_install = false,
                auto_install = true,
                ensure_installed = { "lua", "vim", "javascript", "typescript", "python" },
                ignore_install = {},
                modules = {},
                highlight = {
                    enable = true,
                    additional_vim_regex_highlighting = false,
                },
                indent = { enable = true },
                textobjects = {
                    select = {
                        enable = false,
                        lookahead = true,
                        keymaps = {
                            ["af"] = "@function.outer",
                            ["if"] = "@function.inner",
                            ["ac"] = "@class.outer",
                            ["ic"] = "@class.inner",
                        },
                    },
                },
            })
        end,
    },
}
