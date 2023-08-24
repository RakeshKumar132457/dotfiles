-- lsp/servers/rust_analyzer.lua

local lspconfig = require('lspconfig')
local general_config = require('lsp.general.config')

lspconfig.rust_analyzer.setup {
    on_attach = general_config.on_attach,
    capabilities = general_config.capabilities,
    flags = general_config.flags,
    settings = {
        ["rust-analyzer"] = {
            assist = {
                importMergeBehavior = "last", -- Specify how auto imports should be merged
                importPrefix = "by_self",     -- Specify how imports should be added
            },
            cargo = {
                loadOutDirsFromCheck = true -- Use cargo to get metadata for a Rust project
            },
            procMacro = {
                enable = true -- Enable support for procedural macros
            },
        },
    },
    -- Other possible options: `root_dir`, `filetypes`, `on_init`, `handlers`, etc.
}
