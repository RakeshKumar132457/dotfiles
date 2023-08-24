-- Safely try to require the necessary modules andCONSTANTS
local CONSTANTS = require('utils.constants')
local safely_require = require('utils.safely_require').safely_require

local cmp = safely_require('cmp')
local luasnip = safely_require('luasnip')

-- If the modules aren't available, exit the configuration
if not cmp or not luasnip then
    return
end

-- ============================
-- NVIM-CMP Configuration
-- ============================

-- Configuration for the snippet engine
local snippet_config = {
    expand = function(args)
        -- Use LuaSnip to expand the selected snippet
        luasnip.lsp_expand(args.body)
    end
}

-- Key mappings for autocompletion
local mapping_config = cmp.mapping.preset.insert({
    ['<C-b>'] = cmp.mapping.scroll_docs(-4), -- Scroll documentation up by 4 lines
    ['<C-f>'] = cmp.mapping.scroll_docs(4),  -- Scroll documentation down by 4 lines
    ['<C-Space>'] = cmp.mapping.complete(),  -- Trigger completion
    ['<C-e>'] = cmp.mapping.abort(),         -- Abort/close the completion menu
    ['<CR>'] = cmp.mapping.confirm({         -- Confirm the selected completion item
        select = true
    }),
})

-- Sources for autocompletion
local sources_config = {
    { name = 'nvim_lsp' }, -- LSP-based completions
    { name = 'luasnip' },  -- Snippet-based completions
    { name = 'nvim_lua' }  -- Lua-based completions (useful for Neovim Lua API)
}

-- Border settings for the completion and documentation windows
local window_config = {
    completion = cmp.config.window.bordered({ side_padding = 0 }), -- Border for completion window
    documentation = cmp.config.window.bordered(),                  -- Border for documentation window
}

-- Formatting for the completion menu
local formatting_config = {
    format = function(entry, vim_item)
        -- Attach icons to the kind of completion item
        vim_item.kind = string.format('\t%s %s\t', CONSTANTS.NVIM_CMP.KIND_ICONS[vim_item.kind], vim_item.kind)

        -- Display the source of the completion item
        vim_item.menu = CONSTANTS.NVIM_CMP.SOURCE_MENU[entry.source.name]
        return vim_item
    end
}

-- ============================
-- Final NVIM-CMP Setup
-- ============================

cmp.setup {
    snippet = snippet_config,
    mapping = mapping_config,
    sources = sources_config,
    window = window_config,
    formatting = formatting_config,
}

return {} -- Return an empty table, as we don't need to expose anything from this module
