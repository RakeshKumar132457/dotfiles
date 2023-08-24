-- lsp/servers/pyright.lua

local lspconfig = require('lspconfig')
local general_config = require('lsp.general.config')

lspconfig.pyright.setup {
    on_attach = general_config.on_attach,
    capabilities = general_config.capabilities,
    flags = general_config.flags,
    settings = {
        python = {
            analysis = {
                autoSearchPaths = true,       -- Automatically search paths in the Python environment
                useLibraryCodeForTypes = true -- Use library code (rather than type stubs) to infer types
            },
        },
    },
    -- Other possible options: `root_dir`, `filetypes`, `on_init`, `handlers`, etc.
}
