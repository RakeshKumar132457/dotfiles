-- lsp/servers/gopls.lua

local lspconfig = require('lspconfig')
local general_config = require('lsp.general.config')

lspconfig.gopls.setup {
    on_attach = general_config.on_attach,
    capabilities = general_config.capabilities,
    flags = general_config.flags,
    cmd = { "gopls" }, -- Command to start the gopls LSP server
    settings = {
        gopls = {
            analyses = {
                unusedparams = true, -- Enable analysis for unused parameters
            },
            staticcheck = true,      -- Enable static checks
        },
    },
    -- Other possible options: `root_dir`, `filetypes`, `on_init`, `handlers`, etc.
}
