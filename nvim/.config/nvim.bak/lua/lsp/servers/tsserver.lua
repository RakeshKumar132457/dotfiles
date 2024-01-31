-- lsp/servers/tsserver.lua

local lspconfig = require('lspconfig')
local general_config = require('lsp.general.config')

lspconfig.tsserver.setup {
    on_attach = function(client, bufnr)
        -- Disable tsserver formatting if you plan to use prettier
        client.server_capabilities.document_formatting = false
        general_config.on_attach(client, bufnr)
    end,
    capabilities = general_config.capabilities,
    flags = general_config.flags,
    -- Other possible options: `root_dir`, `filetypes`, `on_init`, `handlers`, etc.
}
