return {
    {
        'nvim-treesitter/nvim-treesitter',
        event = "VeryLazy",
        build = ":TSUpdate",
        branch = "master",
        opts = {
            ensure_installed = {
                "lua", "vim", "vimdoc", "query",
                "javascript", "typescript", "tsx",
                "python", "rust", "c", "cpp",
                "json", "yaml", "toml", "markdown", "markdown_inline",
                "bash", "html", "css"
            },
            auto_install = true,
            highlight = { enable = true },
            indent = { enable = true },
        },
        config = function(_, opts)
            require('nvim-treesitter.configs').setup(opts)
        end,
    },
}

