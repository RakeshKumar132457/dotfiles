return {
    'nvim-treesitter/nvim-treesitter',
    event = 'BufEnter',
    dependencies = {
        'nvim-treesitter/nvim-treesitter-textobjects',
    },
    config = function()
        require('nvim-treesitter.configs').setup({
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
}
