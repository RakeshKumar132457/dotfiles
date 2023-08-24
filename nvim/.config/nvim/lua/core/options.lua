local CONSTANTS = require('utils.constants')

-- =================== INDENTATION SETTINGS ===================
-- Soft tabstop: Number of spaces that a <Tab> counts for while performing editing operations, like inserting a <Tab> or using <BS>.
vim.o.softtabstop     = CONSTANTS.NVIM_OPTIONS.SOFTTABSTOP

-- Tabstop: Width of tab character.
vim.o.tabstop         = CONSTANTS.NVIM_OPTIONS.TABSTOP  -- Possible values: 2, 4, 8...

-- Shiftwidth: Number of spaces to use for each step of (auto)indent.
vim.o.shiftwidth      = CONSTANTS.NVIM_OPTIONS.SHIFTWIDTH  -- Possible values: 2, 4, 8...

-- Expandtab: Use spaces instead of tabs.
vim.o.expandtab       = CONSTANTS.NVIM_OPTIONS.EXPANDTAB  -- Possible values: true, false

-- Smartindent: Automatically insert extra level of indentation in some cases.
vim.o.smartindent     = CONSTANTS.NVIM_OPTIONS.SMARTINDENT  -- Possible values: true, false

-- =================== SEARCH SETTINGS ===================
-- Hlsearch: Highlight all search matches.
vim.o.hlsearch        = CONSTANTS.NVIM_OPTIONS.HLSEARCH  -- Possible values: true, false

-- Ignorecase: Ignore case in search patterns.
vim.o.ignorecase      = CONSTANTS.NVIM_OPTIONS.IGNORECASE  -- Possible values: true, false

-- Smartcase: Override the 'ignorecase' option if the search pattern contains uppercase characters.
vim.o.smartcase       = CONSTANTS.NVIM_OPTIONS.SMARTCASE  -- Possible values: true, false

-- =================== DISPLAY SETTINGS ===================
-- Showmode: Do not display the mode (e.g., "INSERT") in the status line.
vim.o.showmode        = CONSTANTS.NVIM_OPTIONS.SHOWMODE  -- Possible values: true, false

-- Number: Display line numbers.
vim.wo.number         = CONSTANTS.NVIM_OPTIONS.NUMBER  -- Possible values: true, false

-- Relativenumber: Display line numbers relative to the cursor's line number.
vim.wo.relativenumber = CONSTANTS.NVIM_OPTIONS.RELATIVENUMBER  -- Possible values: true, false

-- Signcolumn: Always show the sign column, useful for plugins like GitGutter.
vim.wo.signcolumn     = CONSTANTS.NVIM_OPTIONS.SIGNCOLUMN  -- Possible values: 'yes', 'no', 'auto'

-- Termguicolors: Use GUI colors in the terminal (for themes that support true color).
vim.o.termguicolors   = CONSTANTS.NVIM_OPTIONS.TERMGUICOLORS  -- Possible values: true, false

-- =================== GENERAL BEHAVIOR SETTINGS ===================
-- Mouse: Enable mouse support.
vim.o.mouse           = CONSTANTS.NVIM_OPTIONS.MOUSE  -- Possible values: 'a' (all modes), 'i' (insert mode), 'n' (normal mode), nil (no mouse support)

-- Undofile: Save undo history to an undo file.
vim.o.undofile        = CONSTANTS.NVIM_OPTIONS.UNDOFILE  -- Possible values: true, false

-- Encoding: Set the character encoding.
vim.opt.encoding      = CONSTANTS.NVIM_OPTIONS.ENCODING  -- Possible values: 'utf-8', 'latin1', etc.

-- Updatetime: Time in milliseconds to wait before writing the swap file after a change.
vim.o.updatetime      = CONSTANTS.NVIM_OPTIONS.UPDATETIME  -- Possible values: 50, 100, 250...

-- Completeopt: Completion options (for deoplete, for example).
vim.o.completeopt     = CONSTANTS.NVIM_OPTIONS.COMPLETEOPT  -- Possible values: 'menu', 'menuone', 'noselect', 'noinsert'

