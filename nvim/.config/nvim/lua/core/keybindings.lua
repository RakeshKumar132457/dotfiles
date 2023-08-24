-- ~/.config/nvim/core/keybindings.lua

local opts = { silent = true, noremap = true }

-- ==========================================
-- Telescope Keybindings
-- ==========================================
-- Telescope is a highly extensible fuzzy finder framework for Neovim.

-- Search for files in the project
vim.keymap.set('n', '<leader>sf', require('telescope.builtin').find_files, { desc = '[S]earch [F]iles' })

-- Search for text in the project using grep
vim.keymap.set('n', '<leader>sg', require('telescope.builtin').live_grep, { desc = '[S]earch by [G]rep' })

-- Search for the current word under the cursor in the project
vim.keymap.set('n', '<leader>sw', require('telescope.builtin').grep_string, { desc = '[S]earch current [W]ord' })

-- Search for Neovim help tags
vim.keymap.set('n', '<leader>sh', require('telescope.builtin').help_tags, { desc = '[S]earch [H]elp' })

-- Search for LSP diagnostics in the project
vim.keymap.set('n', '<leader>sd', require('telescope.builtin').diagnostics, { desc = '[S]earch [D]iagnostics' })

-- Search for recently opened files
vim.keymap.set('n', '<leader>?', require('telescope.builtin').oldfiles, { desc = '[?] Find recently opened files' })

-- Search for keymaps
vim.keymap.set('n', '<leader>sk', require('telescope.builtin').keymaps, { desc = '[S]earch keymaps' })

-- Search for existing buffers
vim.keymap.set('n', '<leader><space>', require('telescope.builtin').buffers, { desc = '[ ] Find existing buffers' })


-- Fuzzily search in the current buffer
vim.keymap.set('n', '<leader>/', function()
    require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
        winblend = 20,
        previewer = false,
    })
end, { desc = '[/] Fuzzily search in current buffer]' })

-- Search for LSP document symbols in the current file
vim.keymap.set('n', '<leader>sl', require('telescope.builtin').lsp_document_symbols,
    { desc = '[S]earch LSP document [S]ymbols' })

-- ==========================================
-- NvimTree Keybindings
-- ==========================================
-- NvimTree provides a file explorer tree for Neovim.

-- Toggle the file explorer
vim.keymap.set('n', '<leader>e', ':NvimTreeToggle<CR>', opts)

-- ==========================================
-- Lspsaga Keybindings
-- ==========================================
-- Lspsaga provides a set of UI enhancements for the built-in LSP.

-- Show the LSP outline of the current file
vim.keymap.set('n', '<leader>o', '<cmd>Lspsaga outline<CR>', opts)

-- Show hover documentation
vim.keymap.set('n', 'K', '<cmd>Lspsaga hover_doc<CR>', opts)

-- Find references or definitions
vim.keymap.set('n', 'gh', '<cmd>Lspsaga lsp_finder<CR>', opts)

-- ==========================================
-- Code Runner Keybindings
-- ==========================================
-- This seems to be a custom function to run code.

-- Run the current code
vim.keymap.set('n', '<leader>cr', ':lua require"utils.code_runner".run()<CR>')

-- ==========================================
-- Terminal Keybindings
-- ==========================================
-- Toggle a terminal in Neovim.

-- Toggle the terminal
vim.keymap.set('n', '<leader>tr', '<cmd>ToggleTerm<CR>')

-- ==========================================
-- Harpoon Keybindings
-- ==========================================
-- Harpoon provides a mechanism to bookmark files and quickly toggle between them.

-- Add the current file to harpoon's list
vim.keymap.set('n', '<leader>ha', function() require('harpoon.mark').add_file() end,
    { desc = 'Harpoon: Add current file' })

-- Show the harpoon UI (This will display a list of marked files)
vim.keymap.set('n', '<leader>hs', function() require('harpoon.ui').toggle_quick_menu() end, { desc = 'Harpoon: Show UI' })

-- Navigate to the next and previous marked files
-- Note: The nav_file function with arguments 1 and -1 is hypothetical. You might need to implement this logic or check if newer versions of harpoon have added this feature.
vim.keymap.set('n', '<leader>hn', function() require('harpoon.ui').nav_file(1) end,
    { desc = 'Harpoon: Go to next marked file' })
vim.keymap.set('n', '<leader>hp', function() require('harpoon.ui').nav_file(-1) end,
    { desc = 'Harpoon: Go to previous marked file' })


-- ==========================================
-- Personal Keybindings
-- ==========================================
-- These are custom keybindings for personal use.

-- Yank to system clipboard
vim.keymap.set({ 'n', 'v' }, '<leader>y', '"+y')

return {}
