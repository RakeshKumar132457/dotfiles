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
        lazy = true,
        event = 'BufRead',
        dependencies = {
            'nvim-treesitter/nvim-treesitter-textobjects',
        },
        config = function()
            require('plugins.configs.treesitter').setup()
        end
    },

    -- ========================
    -- UI/UX Plugins
    -- Plugins that enhance the user interface and user experience
    -- ========================

    {
        "folke/tokyonight.nvim",
        event = 'VimEnter',
        lazy = false,
        priority = 1000,
        config = function()
            vim.cmd([[colorscheme tokyonight]])
        end,
    },

    {
        'lukas-reineke/indent-blankline.nvim',
        event = "BufEnter",
        config = function()
            require('plugins.configs.indent_blankline').setup()
        end
    },

    {
        'lewis6991/gitsigns.nvim',
        event = 'BufRead',
        config = true
    },

    {
        'nvim-lualine/lualine.nvim',
        event = "VimEnter",
        lazy = true,
        config = true,
    },

    {
        'akinsho/bufferline.nvim',
        event = "VimEnter",
        lazy = true,
        config = true,
    },

    {
        'nvim-tree/nvim-web-devicons',
        lazy = false
    },

    -- ========================
    -- LSP and Autocompletion
    -- Plugins related to LSP, autocompletion, and code intelligence
    -- ========================

    {
        'neovim/nvim-lspconfig',
        after = 'nvim-lspconfig',
        lazy = false
    },

    {
        'williamboman/mason.nvim',
        lazy = false,
        dependencies = {
            'williamboman/mason-lspconfig.nvim'
        },
        config = true
    },

    {
        "hrsh7th/nvim-cmp",
        lazy = true,
        event = 'InsertEnter',
        dependencies = {
            "hrsh7th/cmp-nvim-lsp",
            'hrsh7th/cmp-nvim-lua',
            "saadparwaiz1/cmp_luasnip"
        },
        config = function()
            require('plugins.configs.nvim_cmp')
        end
    },

    {
        "L3MON4D3/LuaSnip",
        lazy = true,
        event = "InsertEnter",
        config = function()
            require('plugins.configs.luasnippets')
        end
    },

    {
        "ray-x/lsp_signature.nvim",
        lazy = true,
        event = 'InsertEnter',
        config = function()
            require("lsp_signature").setup()
        end
    },

    {
        "glepnir/lspsaga.nvim",
        lazy = true,
        event = "VeryLazy",
        config = function()
            require('plugins.configs.lspsaga').setup()
        end,
    },

    -- ========================
    -- Navigation and Search
    -- Plugins that assist with navigating files and searching content
    -- ========================

    {
        'nvim-telescope/telescope.nvim',
        lazy = true,
        cmd = 'Telescope',
        config = function()
            require('plugins.configs.telescope').setup()
        end,
        dependencies = {
            'nvim-lua/plenary.nvim'
        }
    },

    {
        'nvim-tree/nvim-tree.lua',
        cmd = "NvimTreeToggle",
        config = true
    },

    {
        'ThePrimeagen/harpoon',
        event = "BufRead", -- or another appropriate event
        lazy = true,
        config = true,
        description = "Quickly navigate between marked files and terminals"
    },

    {
        'ggandor/leap.nvim',
        event = 'BufRead',
        lazy = true,
        config = function()
            require('leap').add_default_mappings()
        end
    },



    -- ========================
    -- Editing Enhancements
    -- Plugins that enhance the editing experience
    -- ========================

    {
        'windwp/nvim-autopairs',
        event = "InsertEnter",
        config = true
    },

    {
        "windwp/nvim-ts-autotag",
        ft = { 'html', 'javascript.jsx', 'javascriptreact', 'typescript.tsx', 'typescriptreact', 'xml' },
        config = function()
            require("nvim-ts-autotag").setup { enable = true }
        end
    },

    {
        'numToStr/Comment.nvim',
        keys = { 'gcc', 'gbc', 'gc', 'gb' },
        config = true
    },

    -- ========================
    -- Miscellaneous
    -- Plugins with unique functionalities that don't fit into other categories
    -- ========================

    {
        "akinsho/toggleterm.nvim",
        lazy = true,
        cmd = 'ToggleTerm',
        config = true,
        description = "Add terminal functionality within Neovim"
    },

    {
        "m4xshen/hardtime.nvim",
        lazy = true,
        event = 'InsertEnter',
        opts = {},
        description = "Prevents repeated key presses (e.g., hjkl)"
    },

    {
        'j-hui/fidget.nvim',
        event = "BufRead",
        config = true,
        description = "Displays ongoing processes similar to the bottom bar in VSCode"
    },

    {
        'folke/neodev.nvim',
        event = "InsertEnter",
        config = true,
        description = "Assists with Neovim development"
    },

    {
        "folke/which-key.nvim",
        lazy = true,
        even = 'InsertLeave',
        config = true,
        description = "Suggests key mappings based on the initial key pressed"
    },

}
