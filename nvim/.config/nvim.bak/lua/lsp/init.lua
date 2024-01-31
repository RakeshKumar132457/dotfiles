-- lsp/init.lua

-- Load general LSP configurations and utilities
local general_config = require('lsp.general.config')
local general_keybindings = require('lsp.general.lsp_keybindings')

-- Load individual language servers
local clangd = require('lsp.servers.clangd')
local gopls = require('lsp.servers.gopls')
local lua_ls = require('lsp.servers.lua_ls')
local pyright = require('lsp.servers.pyright')
local tsserver = require('lsp.servers.tsserver')
local html = require('lsp.servers.html')

return {
    -- General configurations and utilities
    config = general_config,
    keybindings = general_keybindings,

    -- Individual language servers
    clangd = clangd,
    gopls = gopls,
    lua_ls = lua_ls,
    pyright = pyright,
    tsserver = tsserver,
    html = html
}
