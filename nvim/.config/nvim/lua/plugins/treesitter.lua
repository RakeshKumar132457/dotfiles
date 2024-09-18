local function toggle_treesitter_feature(feature)
    local ts_config = require('nvim-treesitter.configs')
    local current = ts_config.get_module(feature).enable
    ts_config.setup({ [feature] = { enable = not current } })
    vim.notify(feature .. " is now " .. (not current and "enabled" or "disabled"))
end

return {
    {
        'nvim-treesitter/nvim-treesitter',
        event = { "BufWinEnter", "BufNewFile" }, -- Delay load to after buffer is shown
        build = ":TSUpdate",
        dependencies = {
            { 'nvim-treesitter/nvim-treesitter-textobjects', event = "VeryLazy" }, -- Load only when needed
        },
        cmd = { "TSInstall", "TSBufEnable", "TSBufDisable", "TSModuleInfo" },
        config = function()
            require('nvim-treesitter.configs').setup({
                sync_install = false,
                auto_install = false,                   -- Disable auto installation for better performance
                highlight = {
                    enable = true,                      -- Keep highlight enabled
                    disable = function(_, buf)
                        local max_filesize = 100 * 1024 -- 100 KB max file size
                        local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
                        if ok and stats and stats.size > max_filesize then
                            return true -- Disable on large files
                        end
                    end,
                    additional_vim_regex_highlighting = false, -- Disable regex-based highlighting
                },
                indent = { enable = true },                    -- Enable indent, as it's lightweight
                textobjects = {
                    select = {
                        enable = false, -- Disabled by default to avoid extra load
                        lookahead = true,
                        keymaps = {
                            ["af"] = "@function.outer",
                            ["if"] = "@function.inner",
                            ["ac"] = "@class.outer",
                            ["ic"] = "@class.inner",
                        },
                    },
                },
                ensure_installed = { "lua", "vim", "javascript", "typescript", "python" }, -- Minimize installed parsers
            })

            -- Defer parser installation check by 2000ms for better startup performance
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
