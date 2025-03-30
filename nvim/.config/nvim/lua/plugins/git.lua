return {
    {
        'lewis6991/gitsigns.nvim',
        event = 'BufReadPost',
        config = function()
            local gitsigns = require('gitsigns');
            gitsigns.setup({
                on_attach = function(bufnr)
                    local gs = package.loaded.gitsigns

                    local function map(mode, l, r, opts)
                        opts = opts or {}
                        opts.buffer = bufnr
                        vim.keymap.set(mode, l, r, opts)
                    end

                    map('n', ']c', function()
                        if vim.wo.diff then return ']c' end
                        vim.schedule(function() gs.next_hunk() end)
                        return '<Ignore>'
                    end, { expr = true, desc = "[N]ext [C]hange" })
                    map('n', '[c', function()
                        if vim.wo.diff then return '[c' end
                        vim.schedule(function() gs.prev_hunk() end)
                        return '<Ignore>'
                    end, { expr = true, desc = "[P]revious [C]hange" })

                    map('n', '<leader>hs', gs.stage_hunk, { desc = "[H]unk [S]tage" })
                    map('n', '<leader>hr', gs.reset_hunk, { desc = "[H]unk [R]eset" })
                    map('v', '<leader>hs', function() gs.stage_hunk { vim.fn.line('.'), vim.fn.line('v') } end,
                        { desc = "[H]unk [S]tage (visual)" })
                    map('v', '<leader>hr', function() gs.reset_hunk { vim.fn.line('.'), vim.fn.line('v') } end,
                        { desc = "[H]unk [R]eset (visual)" })
                    map('n', '<leader>hS', gs.stage_buffer, { desc = "[H]unk [S]tage Buffer" })
                    map('n', '<leader>hu', gs.undo_stage_hunk, { desc = "[H]unk [U]ndo stage" })
                    map('n', '<leader>hR', gs.reset_buffer, { desc = "[H]unk [R]eset Buffer" })
                    map('n', '<leader>hp', gs.preview_hunk, { desc = "[H]unk [P]review" })
                    map('n', '<leader>hi', gs.preview_hunk_inline, { desc = "[H]unk [I]nline preview" })
                    map('n', '<leader>hb', function() gs.blame_line { full = true } end, { desc = "[H]unk [B]lame line" })
                    map('n', '<leader>hd', gs.diffthis, { desc = "[H]unk [D]iffthis" })
                    map('n', '<leader>hD', function() gs.diffthis('~') end, { desc = "[H]unk [D]iffthis ~" })
                    map('n', '<leader>hQ', function() gs.setqflist('all') end, { desc = "[H]unk [Q]uickfix all" })
                    map('n', '<leader>hq', gs.setqflist, { desc = "[H]unk [Q]uickfix" })

                    map('n', '<leader>tb', gs.toggle_current_line_blame, { desc = "[T]oggle [B]lame line" })
                    map('n', '<leader>td', gs.toggle_deleted, { desc = "[T]oggle [D]eleted" })
                    map('n', '<leader>tw', gs.toggle_word_diff, { desc = "[T]oggle [W]ord diff" })

                    map({ 'o', 'x' }, 'ih', ':<C-U>Gitsigns select_hunk<CR>', { desc = "[I]nside [H]unk" })
                end
            })
        end
    },
    {
        "sindrets/diffview.nvim",
        cmd = { 'DiffviewOpen', 'DiffviewLog', 'DiffviewFileHistory', 'DiffviewFocusFiles', 'DiffviewClose', 'DiffviewToggleFiles' },
        keys = {
            { "<leader>dv", "<cmd>DiffviewOpen<cr>",        desc = "[D]iff [V]iew Open" },
            { "<leader>dc", "<cmd>DiffviewClose<cr>",       desc = "[D]iff View [C]lose" },
            { "<leader>dh", "<cmd>DiffviewFileHistory<cr>", desc = "[D]iff File [H]istory" },
            { "<leader>dl", "<cmd>DiffviewFocusFiles<cr>",  desc = "[D]iff Focus Fi[L]es" },
            { "<leader>dt", "<cmd>DiffviewToggleFiles<cr>", desc = "[D]iff [T]oggle Files" },
        },
        config = true
    }
}
