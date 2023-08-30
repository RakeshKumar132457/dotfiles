-- ~/.config/nvim/lua/plugins/config/treesitter_config.lua

local treesitter_config = {}

function treesitter_config.setup()
    -- ============================
    -- Load Dependencies
    -- ============================

    -- Load the utility module for error handling
    local utils_status, utils = pcall(require, 'utils')
    if not utils_status then
        print('Problem loading utils file...', utils)
        return
    end

    -- Safely load the Tree-sitter module using pcall
    local treesitter_status, treesitter = pcall(require, 'nvim-treesitter.configs')
    if not treesitter_status then
        print(utils.error_msg('treesitter.lua', 'configs'))
        return
    end

    -- ============================
    -- Supported Languages
    -- ============================

    -- List of languages to ensure are installed for Tree-sitter
    local supported_languages = {
        "bash", "c", "cpp", "css", "go", "html", "java", "javascript", "json",
        "lua", "markdown", "python", "rust", "scss", "tsx", "typescript"
    }

    -- ============================
    -- Tree-sitter Configuration
    -- ============================

    treesitter.setup {
        ensure_installed = supported_languages, -- Ensure the listed languages are installed

        -- Automatically install parsers on startup for unsupported languages
        auto_install = true,

        -- Ignore these parsers when running `:TSUpdate`
        ignore_install = {},

        -- Run `:TSUpdate` without the prompt
        sync_install = true,

        highlight = {
            enable = true, -- Enable syntax highlighting
            disable = {},  -- List of languages for which to disable highlighting
        },

        indent = {
            enable = true, -- Enable automatic indentation
            disable = {},  -- List of languages for which to disable indentation
        },

        -- Additional Tree-sitter modules can be added here, such as:
        -- incremental_selection = {
        --     enable = true,
        --     keymaps = {
        --         init_selection = "gnn",
        --         node_incremental = "grn",
        --         scope_incremental = "grc",
        --         node_decremental = "grm",
        --     },
        -- },

        -- Define other modules here
        modules = {
            -- Example:
            -- rainbow = {
            --     enable = true,
            --     extended_mode = true,
            --     max_file_lines = 1000,
            -- }
        }
    }
end

return treesitter_config
