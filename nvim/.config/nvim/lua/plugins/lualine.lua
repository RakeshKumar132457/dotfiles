return {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    event = "VeryLazy",
    config = function()
        local lsp_client = function()
            local buf_clients = vim.lsp.get_clients({ bufnr = 0 })
            if next(buf_clients) == nil then
                return "No LSP"
            end
            local client_names = {}
            for _, client in ipairs(buf_clients) do
                table.insert(client_names, client.name)
            end
            return "󰄭 " .. table.concat(client_names, ", ")
        end

        require('lualine').setup({
            options = {
                theme = "auto", -- Automatically inherits Catppuccin theme colors
                component_separators = { left = '│', right = '│' },
                section_separators = { left = '', right = '' },
                disabled_filetypes = {
                    statusline = { "dashboard", "alpha", "ministarter" },
                },
                globalstatus = true, -- Clean, modern global statusline
            },
            sections = {
                lualine_a = {
                    { 'mode', separator = { left = '' }, right_padding = 2 },
                },
                lualine_b = {
                    'branch',
                    'diff',
                },
                lualine_c = {
                    { 'filename', file_status = true, path = 1 },
                },
                lualine_x = {
                    'diagnostics',
                    { lsp_client, color = { fg = '#a6e3a1', gui = 'bold' } },
                    'encoding',
                    'fileformat',
                    'filetype',
                },
                lualine_y = { 'progress' },
                lualine_z = {
                    { 'location', separator = { right = '' }, left_padding = 2 },
                },
            },
            inactive_sections = {
                lualine_a = {},
                lualine_b = {},
                lualine_c = { 'filename' },
                lualine_x = { 'location' },
                lualine_y = {},
                lualine_z = {}
            },
        })
    end
}
