-- lsp/general/keybindings.lua

local M = {}

M.setup = function(on_attach)
    -- Keybindings that are common across all LSP servers can be defined here.
    -- These keybindings will be set up in the on_attach function for each LSP server.

    local opts = { noremap = true, silent = true }

    -- Go to definition
    vim.api.nvim_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)

    -- Go to type definition
    vim.api.nvim_set_keymap('n', '<leader>td', '<Cmd>lua vim.lsp.buf.type_definition()<CR>', opts)

    -- Show hover popup
    vim.api.nvim_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)

    -- Go to implementation
    vim.api.nvim_set_keymap('n', 'gi', '<Cmd>lua vim.lsp.buf.implementation()<CR>', opts)

    -- Show signature help
    vim.api.nvim_set_keymap('n', '<C-k>', '<Cmd>lua vim.lsp.buf.signature_help()<CR>', opts)

    -- Rename symbol
    vim.api.nvim_set_keymap('n', '<leader>rn', '<Cmd>lua vim.lsp.buf.rename()<CR>', opts)

    -- Code actions
    vim.api.nvim_set_keymap('n', '<leader>ca', '<Cmd>lua vim.lsp.buf.code_action()<CR>', opts)

    -- List all references
    vim.api.nvim_set_keymap('n', 'gr', '<Cmd>lua vim.lsp.buf.references()<CR>', opts)

    -- Format document
    vim.keymap.set({ 'n', 'v' }, '<leader>f', function() vim.lsp.buf.format { async = true } end, opts)


    -- Workspace symbol search
    vim.api.nvim_set_keymap('n', '<leader>s', '<Cmd>lua vim.lsp.buf.workspace_symbol()<CR>', opts)

    -- Add workspace folder
    vim.api.nvim_set_keymap('n', '<leader>wa', '<Cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)

    -- Remove workspace folder
    vim.api.nvim_set_keymap('n', '<leader>wr', '<Cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)

    -- List workspace folders
    vim.api.nvim_set_keymap('n', '<leader>wl', '<Cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>',
        opts)

    -- Diagnostics
    vim.api.nvim_set_keymap('n', '[d', '<Cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
    vim.api.nvim_set_keymap('n', ']d', '<Cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
    vim.api.nvim_set_keymap('n', '<space>e', '<Cmd>lua vim.diagnostic.open_float(0, {scope="cursor"})<CR>', opts)
    vim.api.nvim_set_keymap('n', '<space>q', '<Cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)

    -- Call the original on_attach function (if provided)
    if on_attach then
        on_attach()
    end
end

return M
