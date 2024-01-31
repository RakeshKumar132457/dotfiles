-- lsp/general/config.lua

-- Import necessary modules and utilities
local CONSTANTS = require('utils.constants')
local safely_require = require('utils.safely_require').safely_require
local lsp_keybindings = require('lsp.general.lsp_keybindings')

local lspconfig = safely_require('lspconfig')
local cmp_nvim_lsp = safely_require('cmp_nvim_lsp')

-- Exit if required modules aren't available
if not lspconfig or not cmp_nvim_lsp then
    return
end

-- ============================
-- LSP Capabilities
-- ============================

-- Extend the default LSP capabilities provided by nvim-cmp
local capabilities = cmp_nvim_lsp.default_capabilities()

-- ============================
-- LSP Diagnostic Signs
-- ============================

-- Define diagnostic signs for LSP
for type, icon in pairs(CONSTANTS.LSP.SIGNS) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

-- ============================
-- LSP On Attach Function
-- ============================

-- Function to run when the LSP server is attached to a buffer
local on_attach = function(client, bufnr)
    -- Set up LSP keybindings
    lsp_keybindings.setup()
end

-- ============================
-- Return Configurations
-- ============================

return {
    on_attach = on_attach,       -- Function to run on attaching LSP to buffer
    capabilities = capabilities, -- LSP capabilities
    flags = CONSTANTS.LSP.FLAGS  -- LSP flags
}
