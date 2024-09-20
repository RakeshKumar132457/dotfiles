local function toggle_treesitter_feature(feature)
    local ts_config = require('nvim-treesitter.configs')
    local module = ts_config.get_module(feature)

    if module and module.enable ~= nil then
        local current_state = module.enable
        ts_config.setup({
            -- Add the missing required fields here
            sync_install = false,
            auto_install = false,
            ensure_installed = {}, -- Keep empty to avoid modifying installed parsers
            ignore_install = {},
            modules = {
                [feature] = {
                    enable = not current_state,
                    disable = {}, -- Disable field required by TSModule
                    keymaps = {}, -- Required for TSModule
                    is_supported = function(lang)
                        return require('nvim-treesitter.parsers').get_parser_configs()[lang] ~= nil
                    end,
                    module_path = '',                          -- Required module path field
                    attach = function() end,                   -- Function to attach Treesitter to a buffer
                    detach = function() end,                   -- Function to detach Treesitter from a buffer
                    enabled_buffers = {},                      -- Buffers where the module is enabled
                    additional_vim_regex_highlighting = false, -- Matching field
                }
            }
        })
        vim.notify(feature .. " is now " .. (not current_state and "enabled" or "disabled"))
    else
        vim.notify("Feature " .. feature .. " is not available.", vim.log.levels.ERROR)
    end
end

-- The rest of the configuration remains the same
return {
    {
        'nvim-treesitter/nvim-treesitter',
        event = { "BufWinEnter", "BufNewFile" },
        build = ":TSUpdate",
        dependencies = {
            { 'nvim-treesitter/nvim-treesitter-textobjects', event = "VeryLazy" },
        },
        cmd = { "TSInstall", "TSBufEnable", "TSBufDisable", "TSModuleInfo" },
        config = function()
            require('nvim-treesitter.configs').setup({
                -- Global setup for Treesitter
                sync_install = false,
                auto_install = false,
                ensure_installed = { "lua", "vim", "javascript", "typescript", "python" },
                ignore_install = {},
                modules = {},
                highlight = {
                    enable = true,
                    disable = function(_, buf)
                        local max_filesize = 100 * 1024 -- 100 KB file size limit for highlighting
                        local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
                        if ok and stats and stats.size > max_filesize then
                            return true
                        end
                    end,
                    additional_vim_regex_highlighting = false,
                },
                indent = { enable = true },
                textobjects = {
                    select = {
                        enable = false,   -- Disabled by default for performance
                        lookahead = true, -- Allow lookahead for better object selection
                        keymaps = {
                            ["af"] = "@function.outer",
                            ["if"] = "@function.inner",
                            ["ac"] = "@class.outer",
                            ["ic"] = "@class.inner",
                        },
                    },
                },
            })

            -- Deferred parser installation
            vim.defer_fn(function()
                local parsers = { "lua", "vim", "javascript", "typescript", "python" }
                local ts_install = require('nvim-treesitter.install')
                for _, lang in ipairs(parsers) do
                    local installed = #vim.api.nvim_get_runtime_file('parser/' .. lang .. '.so', false) > 0
                    if not installed then
                        ts_install.ensure_installed(lang)
                    end
                end
            end, 2000)
        end,
        keys = {
            { "<leader>tsh", function() toggle_treesitter_feature("highlight") end,   desc = "Toggle Treesitter Highlight" },
            { "<leader>tsi", function() toggle_treesitter_feature("indent") end,      desc = "Toggle Treesitter Indent" },
            { "<leader>tst", function() toggle_treesitter_feature("textobjects") end, desc = "Toggle Treesitter Textobjects" },
        },
    },
}

