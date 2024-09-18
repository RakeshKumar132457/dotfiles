return {
    'nvim-lualine/lualine.nvim',
    enabled = false,    -- Keep it disabled as per your current setup
    event = "VeryLazy", -- Load after most plugins, as it's a UI element
    opts = {
        options = {
            component_separators = '|',
            section_separators = { left = '', right = '' },
            globalstatus = true,   -- Use a single statusline for all windows
            refresh = {
                statusline = 1000, -- Refresh every 1000ms
                tabline = 1000,
                winbar = 1000,
            },
        },
        sections = {
            lualine_a = { 'mode' },
            lualine_b = { 'branch', 'diff', 'diagnostics' },
            lualine_c = { { 'filename', path = 1 } }, -- Show relative path
            lualine_x = {
                { 'encoding',   fmt = function(str) return (str ~= 'utf-8') and str or '' end },
                { 'fileformat', fmt = function(str) return (str ~= 'unix') and str or '' end },
                'filetype'
            },
            lualine_y = { 'progress' },
            lualine_z = { 'location' }
        },
    },
}
