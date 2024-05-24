return {
    {

        'nvim-treesitter/nvim-treesitter',
        event = { "BufReadPost", "BufNewFile" },
        dependencies = {
            'nvim-treesitter/nvim-treesitter-textobjects',
        },
        config = function()
            require('nvim-treesitter.configs').setup({
                sync_install = true,
                ensure_installed = {
                    "bash", "c", "cpp", "css", "go", "html", "java", "javascript", "json",
                    "lua", "markdown", "python", "rust", "scss", "tsx", "typescript"
                },
                auto_install = true,
                highlight = {
                    enable = true
                },
                indent = {
                    enable = true
                },
                textobjects = {
                    select = {
                        enable = true,
                        lookahead = true
                    }
                },
            })
        end
    },
    {
        'nvim-treesitter/nvim-treesitter-context',
        enabled = false
    }
}
