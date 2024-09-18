return {
    {
        "windwp/nvim-autopairs",
        event = "InsertEnter",
        opts = {
            check_ts = true,
            ts_config = {
                lua = { 'string' },
                javascript = { 'template_string' },
            },
            fast_wrap = {},
        },
        config = function(_, opts)
            require("nvim-autopairs").setup(opts)

            -- Defer the cmp integration to ensure it doesn't slow down startup
            vim.defer_fn(function()
                local ok, cmp = pcall(require, 'cmp')
                if ok then
                    local cmp_autopairs = require('nvim-autopairs.completion.cmp')
                    cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done())
                end
            end, 1000)
        end
    },
    {
        "windwp/nvim-ts-autotag",
        event = "InsertEnter",
        opts = {
            autotag = {
                enable = true,
                enable_rename = true,
                enable_close = true,
                enable_close_on_slash = true,
                filetypes = {
                    'html', 'javascript', 'typescript', 'javascriptreact', 'typescriptreact',
                    'svelte', 'vue', 'tsx', 'jsx', 'rescript', 'xml', 'php', 'markdown',
                    'astro', 'glimmer', 'handlebars', 'hbs'
                },
            }
        },
    },
}

