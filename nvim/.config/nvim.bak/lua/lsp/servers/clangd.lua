-- lsp/servers/clangd.lua

local lspconfig = require('lspconfig')               -- Import the lspconfig module
local general_config = require('lsp.general.config') -- Import our general LSP configurations

lspconfig.clangd.setup {
    on_attach = general_config.on_attach,                                                         -- Function to run when the LSP server is attached to a buffer
    capabilities = general_config.capabilities,                                                   -- LSP capabilities
    flags = general_config.flags,                                                                 -- LSP flags
    cmd = { "clangd", "--background-index" },                                                     -- Command to start the clangd LSP server
    filetypes = { "c", "cpp", "objc", "objcpp" },                                                 -- Filetypes that clangd should handle
    root_dir = lspconfig.util.root_pattern("compile_commands.json", "compile_flags.txt", ".git"), -- Method to determine the root directory of a project
    init_options = {
        clangdFileStatus = true                                                                   -- Enable file status feature of clangd
    }
    -- Other possible options: `settings`, `on_init`, `handlers`, etc.
}
