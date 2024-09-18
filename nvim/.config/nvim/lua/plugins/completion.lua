return {
    "hrsh7th/nvim-cmp",
    event = { "InsertEnter", "CmdlineEnter" },
    dependencies = {
        { "hrsh7th/cmp-nvim-lsp", event = "InsertEnter" },
        { "hrsh7th/cmp-buffer",   event = "InsertEnter" },
        { "hrsh7th/cmp-path",     event = "InsertEnter" },
        { "hrsh7th/cmp-cmdline",  event = "CmdlineEnter" },
        {
            "L3MON4D3/LuaSnip",
            event = "InsertEnter",
            dependencies = {
                "rafamadriz/friendly-snippets",
            },
            config = function()
                require("luasnip.loaders.from_lua").lazy_load({
                    paths = { vim.fn.stdpath("config") .. "/lua/snippets" }
                })
            end,
        },
        { "saadparwaiz1/cmp_luasnip", event = "InsertEnter" },
    },
    config = function()
        local cmp = require('cmp')
        local luasnip = require('luasnip')

        cmp.setup({
            snippet = {
                expand = function(args)
                    luasnip.lsp_expand(args.body)
                end
            },
            window = {
                completion = cmp.config.window.bordered(),
                documentation = cmp.config.window.bordered()
            },
            mapping = cmp.mapping.preset.insert({
                ["<C-k>"] = cmp.mapping.select_prev_item(),
                ["<C-j>"] = cmp.mapping.select_next_item(),
                ["<C-space>"] = cmp.mapping.complete(),
                ["<CR>"] = cmp.mapping.confirm({ select = true })
            }),
            sources = cmp.config.sources({
                { name = 'nvim_lsp' },
                { name = 'luasnip' },
                { name = 'buffer' },
                { name = 'path' }
            })
        })

        -- Defer the keymaps setup
        vim.defer_fn(function()
            vim.keymap.set({ 'i', 's' }, '<C-k>', function()
                if luasnip.expand_or_jumpable() then
                    luasnip.expand_or_jump()
                end
            end)
            vim.keymap.set({ 'i', 's' }, '<C-j>', function()
                if luasnip.jumpable(-1) then
                    luasnip.jump(-1)
                end
            end)
        end, 100)
    end
}

