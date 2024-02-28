return {
    "hrsh7th/nvim-cmp",
    event = { "InsertEnter" },
    dependencies = {
        "hrsh7th/cmp-nvim-lsp",
        'hrsh7th/cmp-buffer',
        'hrsh7th/cmp-cmdline',
        'hrsh7th/cmp-path',
        "L3MON4D3/LuaSnip",
        "saadparwaiz1/cmp_luasnip"
    },

    config = function()
        local luasnip = require('luasnip')
        local cmp = require('cmp')

        require('nvim-autopairs').setup()

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
                ["<CR>"] = cmp.mapping.confirm({ selected = true })
            }),
            sources = {
                { name = 'nvim_lsp' },
                { name = 'luasnip' },
                { name = 'buffer' },
                { name = 'path' }
            }
        })

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
        require("luasnip.loaders.from_lua").load({ paths = { vim.fn.stdpath("config") .. "/lua/snippets" } })
    end
}
