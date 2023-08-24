-- lsp/init.lua

-- Load general LSP configurations and utilities
local general_config = require('lsp.general.config')
local general_keybindings = require('lsp.general.lsp_keybindings')

-- Load individual language servers
local clangd = require('lsp.servers.clangd')
local gopls = require('lsp.servers.gopls')
local sumneko_lua = require('lsp.servers.sumneko_lua')
local rust_analyzer = require('lsp.servers.rust_analyzer')
local pyright = require('lsp.servers.pyright')
local tsserver = require('lsp.servers.tsserver')

return {
    -- General configurations and utilities
    config = general_config,
    keybindings = general_keybindings,

    -- Individual language servers
    clangd = clangd,
    gopls = gopls,
    sumneko_lua = sumneko_lua,
    rust_analyzer = rust_analyzer,
    pyright = pyright,
    tsserver = tsserver,
}
