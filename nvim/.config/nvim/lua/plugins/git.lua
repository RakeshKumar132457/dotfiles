return {
    {
        'lewis6991/gitsigns.nvim',
        event = 'BufReadPost',
        config = function()
            local gitsigns = require('gitsigns');

            -- Set highlight groups instead of using deprecated settings
            vim.api.nvim_set_hl(0, 'GitSignsAdd', { link = 'GitGutterAdd' })
            vim.api.nvim_set_hl(0, 'GitSignsAddLn', { link = 'GitSignsAddLn' })
            vim.api.nvim_set_hl(0, 'GitSignsAddNr', { link = 'GitSignsAddNr' })

            vim.api.nvim_set_hl(0, 'GitSignsChange', { link = 'GitGutterChange' })
            vim.api.nvim_set_hl(0, 'GitSignsChangeLn', { link = 'GitSignsChangeLn' })
            vim.api.nvim_set_hl(0, 'GitSignsChangeNr', { link = 'GitSignsChangeNr' })

            vim.api.nvim_set_hl(0, 'GitSignsChangedelete', { link = 'GitGutterChangeDelete' })
            vim.api.nvim_set_hl(0, 'GitSignsChangedeleteLn', { link = 'GitSignsChangeLn' })
            vim.api.nvim_set_hl(0, 'GitSignsChangedeleteNr', { link = 'GitSignsChangeNr' })

            vim.api.nvim_set_hl(0, 'GitSignsDelete', { link = 'GitGutterDelete' })
            vim.api.nvim_set_hl(0, 'GitSignsDeleteLn', { link = 'GitSignsDeleteLn' })
            vim.api.nvim_set_hl(0, 'GitSignsDeleteNr', { link = 'GitSignsDeleteNr' })

            vim.api.nvim_set_hl(0, 'GitSignsTopdelete', { link = 'GitGutterDelete' })
            vim.api.nvim_set_hl(0, 'GitSignsTopdeleteLn', { link = 'GitSignsDeleteLn' })
            vim.api.nvim_set_hl(0, 'GitSignsTopdeleteNr', { link = 'GitSignsDeleteNr' })

            -- Gitsigns setup
            gitsigns.setup({
                on_attach = function(bufnr)
                    local gs = package.loaded.gitsigns

                    -- Navigation
                    vim.keymap.set('n', ']c', function()
                        if vim.wo.diff then return ']c' end
                        vim.schedule(function() gs.next_hunk() end)
                        return '<Ignore>'
                    end, { expr = true, desc = "[N]ext [C]hange" })

                    vim.keymap.set('n', '[c', function()
                        if vim.wo.diff then return '[c' end
                        vim.schedule(function() gs.prev_hunk() end)
                        return '<Ignore>'
                    end, { expr = true, desc = "[P]revious [C]hange" })

                    -- Actions
                    vim.keymap.set('n', '<leader>hs', gs.stage_hunk, { desc = "[H]unk [S]tage" })
                    vim.keymap.set('n', '<leader>hr', gs.reset_hunk, { desc = "[H]unk [R]eset" })
                    vim.keymap.set('v', '<leader>hs', function() gs.stage_hunk { vim.fn.line('.'), vim.fn.line('v') } end,
                        { desc = "[H]unk [S]tage (visual)" })
                    vim.keymap.set('v', '<leader>hr', function() gs.reset_hunk { vim.fn.line('.'), vim.fn.line('v') } end,
                        { desc = "[H]unk [R]eset (visual)" })
                    vim.keymap.set('n', '<leader>hS', gs.stage_buffer, { desc = "[H]unk [S]tage Buffer" })
                    vim.keymap.set('n', '<leader>hu', gs.undo_stage_hunk, { desc = "[H]unk [U]ndo stage" })
                    vim.keymap.set('n', '<leader>hR', gs.reset_buffer, { desc = "[H]unk [R]eset Buffer" })
                    vim.keymap.set('n', '<leader>hp', gs.preview_hunk, { desc = "[H]unk [P]review" })
                    vim.keymap.set('n', '<leader>hb', function() gs.blame_line { full = true } end,
                        { desc = "[H]unk [B]lame line" })
                    vim.keymap.set('n', '<leader>tb', gs.toggle_current_line_blame, { desc = "[T]oggle [B]lame line" })
                    vim.keymap.set('n', '<leader>hd', gs.diffthis, { desc = "[H]unk [D]iffthis" })
                    vim.keymap.set('n', '<leader>hD', function() gs.diffthis('~') end, { desc = "[H]unk [D]iffthis ~" })
                    vim.keymap.set('n', '<leader>td', gs.toggle_deleted, { desc = "[T]oggle [D]eleted" })

                    -- Text object
                    vim.keymap.set({ 'o', 'x' }, 'ih', ':<C-U>Gitsigns select_hunk<CR>', { desc = "[I]nside [H]unk" })
                end,
                update_debounce = 100,      -- Set debounce for updates to 100ms (default is 100ms)
                current_line_blame = false, -- Disable line blame for better performance
                sign_priority = 6,          -- Lower priority for better performance
                max_file_length = 50000,    -- Do not enable for files with more than 50k lines
                preview_config = {          -- Use less overhead for the preview window
                    border = 'single',
                    style = 'minimal',
                    relative = 'cursor',
                    row = 0,
                    col = 1
                },
            })
        end
    },
    {
        "sindrets/diffview.nvim",
        cmd = { 'DiffviewOpen', 'DiffviewLog', 'DiffviewFileHistory', 'DiffviewFocusFiles', 'DiffviewClose', 'DiffviewToggleFiles' },
        config = function()
            require('diffview').setup({
                use_icons = false,        -- Disable icons for faster performance
                enhanced_diff_hl = false, -- Disable enhanced diff highlighting
                signs = {                 -- Use simple sign configuration
                    fold_closed = "▸",
                    fold_open = "▾",
                },
            })
        end
    }
}
