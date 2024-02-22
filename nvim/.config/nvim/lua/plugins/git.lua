return {
    {
        'lewis6991/gitsigns.nvim',
        event = 'BufReadPost',
        config = function()
            local gitsigns = require('gitsigns');
            gitsigns.setup({

                on_attach = function(bufnr)
                    local gs = package.loaded.gitsigns
                    local map = function(mode, lhs, rhs, opts)
                        opts = opts or {}
                        opts.buffer = bufnr
                        vim.keymap.set(mode, lhs, rhs, opts)
                    end

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
                    vim.keymap.set('n', '<leader>hs', gs.stage_hunk, { desc = "[H]unk [S]tage " })
                    vim.keymap.set('n', '<leader>hr', gs.reset_hunk, { desc = "[H]unk [R]eset " })
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


                current_line_blame = true
            })
        end
    },
    {
        "sindrets/diffview.nvim",
        cmd = { 'DiffviewOpen', 'DiffviewLog', 'DiffviewFileHistory', 'DiffviewFocusFiles', 'DiffviewClose',
            'DiffviewToggleFiles' },
    },
    {
        "NeogitOrg/neogit",
        cmd = { "Neogit" },
        dependencies = {
            "nvim-lua/plenary.nvim",
            "sindrets/diffview.nvim",
            "nvim-telescope/telescope.nvim",
        },
        config = function()
            require('neogit').setup({})
        end
    }

}
