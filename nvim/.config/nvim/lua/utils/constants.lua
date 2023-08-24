-- CONSTANTS for using in the environment

-- Paths
local PATHS = {
    HOME_CONFIG = vim.fn.stdpath('config'),
    LUA_CONFIG = vim.fn.stdpath('config') .. '/lua/',
    PLUGIN_CONFIG = vim.fn.stdpath('config') .. '/lua/configs',
    LAZYPATH = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
}

-- Events
local EVENTS = {
    VERY_LAZY = 'VeryLazy',
    INSERT_ENTER = 'InsertEnter',
    BUF_ENTER = 'BufEnter'
}

-- Neovim Options
local NVIM_OPTIONS = {
    -- Indentation settings
    INDENT = 4,         -- Default indentation level
    SOFTTABSTOP = 4,    -- Number of spaces that a <Tab> counts for while performing editing operations, like inserting a <Tab> or using <BS>.
    TABSTOP = 4,        -- Number of spaces that a <Tab> in the file counts for.
    SHIFTWIDTH = 4,     -- Size of an "indent". Also the amount of space used for each step of (auto)indent.
    EXPANDTAB = true,   -- Use spaces instead of tabs.
    SMARTINDENT = true, -- Automatically inserts indentation in some cases.

    -- Search settings
    HLSEARCH = true,   -- Highlight all search matches.
    IGNORECASE = true, -- Ignore case in search patterns.
    SMARTCASE = true,  -- Override the 'ignorecase' option if the search pattern contains upper case characters.

    -- Display settings
    SHOWMODE = false,      -- Do not display the mode in the status line.
    NUMBER = true,         -- Show line numbers.
    RELATIVENUMBER = true, -- Show line numbers relative to the cursor.
    SIGNCOLUMN = 'yes',    -- Always show the sign column. Possible values: 'yes', 'no', 'auto'
    TERMGUICOLORS = true,  -- Use GUI colors in terminal (true-color).

    -- General behavior settings
    MOUSE = nil,        -- Do not enable mouse in Neovim. Possible values: 'a' (all modes), 'i' (insert mode), 'n' (normal mode), etc.
    UNDOFILE = true,    -- Save undo history to an undo file.
    ENCODING = "utf-8", -- Set default character encoding.
    UPDATETIME = 250,   -- Time in milliseconds to wait before writing the swap file.
    COMPLETEOPT =
    'menuone,noselect'  -- Controls the behavior of popup menu for command-line completion. Possible values: 'menu', 'menuone', 'noselect', 'noinsert'
}

-- LSP specific constants
local LSP = {
    SIGNS = {
        Error = " ",
        Warn = " ",
        Hint = " ",
        Info = " "
    },
    FLAGS = {
        debounce_text_changes = 150
    }
}

local NVIM_CMP = {
    KIND_ICONS = {
        Text = "",
        Method = "",
        Function = "",
        Constructor = "",
        Field = "",
        Variable = "",
        Class = "ﴯ",
        Interface = "",
        Module = "",
        Property = "ﰠ",
        Unit = "",
        Value = "",
        Enum = "",
        Keyword = "",
        Snippet = "",
        Color = "",
        File = "",
        Reference = "",
        Folder = "",
        EnumMember = "",
        Constant = "",
        Struct = "",
        Event = "",
        Operator = "",
        TypeParameter = ""
    },
    SOURCE_MENU = {
        buffer = "[Buffer]",
        nvim_lsp = "[LSP]",
        luasnip = "[LuaSnip]",
        nvim_lua = "[Lua]"
    }
}

-- Combine all constants into one table
local CONSTANTS = {
    PATHS = PATHS,
    EVENTS = EVENTS,
    NVIM_OPTIONS = NVIM_OPTIONS,
    LSP = LSP,
    NVIM_CMP = NVIM_CMP
}

return CONSTANTS
