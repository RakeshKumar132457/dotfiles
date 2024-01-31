return {
    "hrsh7th/nvim-cmp",
    event = {"InsertEnter"}, 
    dependencies = {
        "hrsh7th/cmp-nvim-lsp",
        "L3MON4D3/LuaSnip",
        "windwp/nvim-ts-autotag",
        "windwp/nvim-autopairs",
    },
    config = function()
        local luasnip = require('luasnip')
        local cmp = require('cmp')

        require('nvim-autopairs').setup()

        cmp.setup({
            snippet = {
                expand =  function(args)
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
                ["<CR>"] = cmp.mapping.confirm({selected = true})
            }),
            sources = {
                {name = 'nvim_lsp'},
                {name = 'luasnip'}
            }
        })
    end
}
