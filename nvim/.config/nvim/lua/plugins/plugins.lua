local CONSTANTS = require('utils.constants')

-- Checking and cloning the lazy.nvim if it doesn't exist
if not vim.loop.fs_stat(CONSTANTS.PATHS.LAZYPATH) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        CONSTANTS.PATHS.LAZYPATH,
    })
end

vim.opt.rtp:prepend(CONSTANTS.PATHS.LAZYPATH)

return {

    -- ========================
    -- Core Plugins
    -- Essential plugins for basic functionality enhancements
    -- ========================

    {
        'nvim-treesitter/nvim-treesitter',
        event = 'BufEnter',
        dependencies = {
            --  "Allows advanced manipulation of syntax-aware text objects within code, such as blocks or brackets."
            'nvim-treesitter/nvim-treesitter-textobjects',
        },
        config = function()
            require('plugins.configs.treesitter').setup()
        end,
        -- description = "Enhances syntax highlighting, code navigation, and text analysis by utilizing efficient, language-specific parsing."
    },

    -- ========================
    -- UI/UX Plugins
    -- Plugins that enhance the user interface and user experience
    -- ========================

    {
        "catppuccin/nvim",
        name = "catppuccin",
        priority = 1000,
        -- description = "Aesthetic Neovim theme with pastel colors for a comfortable coding experience."
    },

    {
        'lukas-reineke/indent-blankline.nvim',
        event = "BufRead",
        config = function()
            require('plugins.configs.indent_blankline').setup()
        end,
        -- description = "Displays indentation guides in empty lines for enhanced code readability."

    },

    {
        'lewis6991/gitsigns.nvim',
        event = 'BufReadPost',
        config = true,
        -- description = "Integrates Git features into the Neovim editor, showing git diff information in the sign column."

    },

    {
        'nvim-lualine/lualine.nvim',
        event = "VimEnter",
        config = true,
        -- description = "A fast and customizable statusline plugin for Neovim, written in Lua."
    },

    {
        'akinsho/bufferline.nvim',
        event = "VimEnter",
        config = true,
        -- description = "Enhances buffer management, displaying open buffers as tabs at the top of the window."
    },

    {
        'nvim-tree/nvim-web-devicons',
        event = 'BufRead',
        -- description = "Adds file type icons to Neovim plugins like NERDTree, vim-airline, and others."
    },

    {
        "sindrets/diffview.nvim",
        cmd = { 'DiffviewOpen', 'DiffviewLog', 'DiffviewFileHistory', 'DiffviewFocusFiles', 'DiffviewClose',
            'DiffviewToggleFiles' },
        -- description = "Provides a side-by-side diff view for comparing files, integrated with Neovim's built-in diff capabilities."
    },

    {
        'goolord/alpha-nvim',
        event = "VimEnter",
        config = function()
            require('plugins.configs.alpha').setup()
        end,
        -- description = "A highly customizable start screen for Neovim, offering quick access to recent files, bookmarks, and more."
    },

    -- ========================
    -- LSP and Autocompletion
    -- Plugins related to LSP, autocompletion, and code intelligence
    -- ========================

    {
        'neovim/nvim-lspconfig',
        event = 'BufRead',
        -- description = "Configures and manages built-in Neovim LSP (Language Server Protocol) clients."
    },

    {
        'williamboman/mason.nvim',
        lazy = false,
        config = function()
            require('plugins.configs.mason').setup()
        end,
        dependencies = {
            -- "Bridges Mason and nvim-lspconfig, streamlining the installation and configuration of LSP servers."
            'williamboman/mason-lspconfig.nvim',

        },
        -- description = "A Neovim plugin for managing external editor tooling like LSP servers, DAP servers, linters, and formatters."
    },

    {
        "hrsh7th/nvim-cmp",
        event = 'InsertEnter',
        dependencies = {
            -- "nvim-cmp source for neovim's built-in LSP, enhancing the completion experience for LSP functions."
            "hrsh7th/cmp-nvim-lsp",

            -- "nvim-cmp source for Neovim Lua API, offering autocompletion for Lua functions in Neovim."
            'hrsh7th/cmp-nvim-lua',

            -- "Integrates LuaSnip snippets with nvim-cmp, providing snippet support in the completion menu."
            "saadparwaiz1/cmp_luasnip"
        },
        config = function()
            require('plugins.configs.nvim_cmp')
        end,
        -- description = "A completion engine plugin for Neovim, providing highly configurable and extensible auto-completion."
    },

    {
        "L3MON4D3/LuaSnip",
        event = "InsertEnter",
        config = function()
            require('plugins.configs.luasnippets')
        end,
        -- description = "A snippet engine for Neovim written in Lua, allowing users to create and manage code snippets."
    },

    {
        "ray-x/lsp_signature.nvim",
        event = 'InsertEnter',
        config = function()
            require("lsp_signature").setup()
        end,
        -- description = "Displays function signature help in a popup window during typing, for Neovim's built-in LSP."
    },

    {
        "glepnir/lspsaga.nvim",
        event = "LspAttach",
        config = function()
            require('plugins.configs.lspsaga').setup()
        end,
        -- description = "A light and stylish UI plugin for Neovim's built-in LSP, offering additional features and visuals."
    },

    {
        "simrat39/rust-tools.nvim",
        config = function()
            require('plugins.configs.rust_tools').setup()
        end,
        ft = 'rust',
        -- description = "Provides extra features for Neovim's built-in LSP support when working with Rust, like inlay hints."
    },

    {
        "nvimtools/none-ls.nvim",
        event = "LspAttach",
        config = function()
            require('plugins.configs.null_ls').setup()
        end,
        -- description = "Allows using non-LSP sources like linters and formatters with Neovim's native LSP functionality."
    },

    {
        "folke/trouble.nvim",
        cmd = { 'Trouble', 'TroubleToggle', 'TroubleRefresh' },
        -- description = "A diagnostic list and viewer for Neovim, making it easier to identify and navigate code issues."
    },

    -- ========================
    -- Navigation and Search
    -- Plugins that assist with navigating files and searching content
    -- ========================

    {
        'nvim-telescope/telescope.nvim',
        cmd = 'Telescope',
        config = function()
            require('plugins.configs.telescope').setup()
        end,
        dependencies = {
            -- "A collection of Lua functions and utilities that serve as a dependency for many Neovim plugins."
            'nvim-lua/plenary.nvim'
        },
        -- description = "A highly extendable fuzzy finder over lists, for Neovim, integrating with various sources."
    },

    {
        'nvim-tree/nvim-tree.lua',
        cmd = "NvimTreeToggle",
        config = true,
        -- description = "A file explorer tree for Neovim, providing a visual representation of the file system."
    },

    {
        'ggandor/leap.nvim',
        event = 'BufRead',
        config = function()
            require('leap').add_default_mappings()
        end,
        -- description = "An efficient and intuitive motion plugin, enabling quick navigation through text in Neovim."
    },

    -- ========================
    -- Editing Enhancements
    -- Plugins that enhance the editing experience
    -- ========================

    {
        'windwp/nvim-autopairs',
        event = "InsertEnter",
        config = true,
        -- description = "Automatically pairs brackets, quotes, and other characters for efficient coding in Neovim."
    },

    {
        "windwp/nvim-ts-autotag",
        ft = { 'html', 'javascript.jsx', 'javascriptreact', 'typescript.tsx', 'typescriptreact', 'xml' },
        config = function()
            require("nvim-ts-autotag").setup { enable = true }
        end,
        -- description = "Automatically updates and closes HTML/XML tags using Neovim's treesitter functionality."

    },

    {
        'numToStr/Comment.nvim',
        keys = { 'gcc', 'gbc' },
        config = true,
        -- description = "Provides easy and configurable commenting functionality in Neovim, supporting multiple languages."
    },

    -- ========================
    -- Miscellaneous
    -- Plugins with unique functionalities that don't fit into other categories
    -- ========================

    {
        "akinsho/toggleterm.nvim",
        event = 'VimEnter',
        config = true,
        -- description = "Add terminal functionality within Neovim"
    },

    {
        "m4xshen/hardtime.nvim",
        event = 'BufRead',
        opts = {
            disabled_filetypes = { "qf", "netrw", "NvimTree", "lazy", "mason", "oil", "alpha", "help" },
        },
        -- description = "Prevents repeated key presses (e.g., hjkl)"
    },

    {
        'j-hui/fidget.nvim',
        event = "LspAttach",
        config = true,
        -- description = "Displays ongoing processes similar to the bottom bar in VSCode"
    },

    {
        'folke/neodev.nvim',
        config = true,
        ft = 'lua',
        -- description = "Assists with Neovim development"
    },

    {
        "folke/which-key.nvim",
        event = 'BufWinEnter',
        config = true,
        -- description = "Suggests key mappings based on the initial key pressed"
    },
}
