return {
    'kevinhwang91/nvim-ufo',
    enabled = false,                         -- Keep it disabled as per your current setup
    event = { "BufReadPost", "BufNewFile" }, -- More specific than "VimEnter"
    dependencies = { 'kevinhwang91/promise-async' },
    opts = {
        filetype_exclude = { 'help', 'alpha', 'dashboard', 'neo-tree', 'Trouble', 'lazy', 'mason', 'norg', 'oil' },
        close_fold_kinds = { "imports", "comment" },
        preview = {
            win_config = {
                border = { "", "─", "", "", "", "─", "", "" },
                winhighlight = "Normal:Folded",
                winblend = 0,
            },
        },
    },
    config = function(_, opts)
        -- Defer the setup to reduce startup time impact
        vim.defer_fn(function()
            local ufo = require('ufo')

            -- Set up autocommand for detaching ufo
            vim.api.nvim_create_autocmd('FileType', {
                group = vim.api.nvim_create_augroup('local_detach_ufo', { clear = true }),
                pattern = opts.filetype_exclude,
                callback = function() ufo.detach() end,
            })

            -- Setup ufo
            ufo.setup(opts)
        end, 0)
    end,
}

