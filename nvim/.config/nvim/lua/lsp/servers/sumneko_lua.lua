-- lsp/servers/sumneko_lua.lua

local lspconfig = require('lspconfig')
local general_config = require('lsp.general.config')


lspconfig.sumneko_lua.setup {
    on_attach = general_config.on_attach,
    capabilities = general_config.capabilities,
    flags = general_config.flags,
    settings = {
        Lua = {
            runtime = {
                version = 'LuaJIT', -- Specify Lua version
                path = vim.split(package.path, ';'),
            },
            diagnostics = {
                globals = { 'vim' }, -- Specify global variables
            },
            workspace = {
                library = {
                    [vim.fn.expand('$VIMRUNTIME/lua')] = true,
                    [vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true,
                },
            },
        },
    },
    -- Other possible options: `root_dir`, `filetypes`, `on_init`, `handlers`, etc.
}
