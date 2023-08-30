local lspconfig = require('lspconfig')
local general_config = require('lsp.general.config') -- Assuming you have a general config

lspconfig.html.setup {
    filetypes = { "html" },
    on_attach = general_config.on_attach,
    capabilities = general_config.capabilities,
    flags = general_config.flags,
    -- other options
}
