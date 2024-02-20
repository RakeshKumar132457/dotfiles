return {
    {
        "windwp/nvim-autopairs",
        event = { "InsertEnter" },
        dependencies = {
            "windwp/nvim-ts-autotag"
        }
    },
    {
        "windwp/nvim-ts-autotag",
        ft = {
            'html', 'javascript', 'typescript', 'javascriptreact', 'typescriptreact', 'svelte', 'vue', 'tsx', 'jsx',
            'rescript', 'xml', 'php', 'markdown', 'astro', 'glimmer', 'handlebars', 'hbs'
        },
        config = function()
            require('nvim-ts-autotag').setup({
                filetypes = { 'html', 'javascript', 'typescript', 'javascriptreact', 'typescriptreact',
                    'svelte', 'vue', 'tsx', 'jsx', 'rescript', 'xml', 'php', 'markdown', 'astro', 'glimmer', 'handlebars',
                    'hbs'
                },
                enable_close_on_slash = true

            })
        end
    },
}
