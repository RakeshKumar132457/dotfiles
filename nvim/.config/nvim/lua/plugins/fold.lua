return {
    'kevinhwang91/nvim-ufo',
    event = "VimEnter",
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
        vim.api.nvim_create_autocmd('FileType', {
            group = vim.api.nvim_create_augroup('local_detach_ufo', { clear = true }),
            pattern = opts.filetype_exclude,
            callback = function()
                require('ufo').detach()
            end,
        })

        require('ufo').setup(opts)
    end,
    enabled = false
}
