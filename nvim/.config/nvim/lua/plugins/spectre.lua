return {
    'nvim-pack/nvim-spectre',
    cmd = "Spectre",
    keys = {
        { "<leader>S",  '<cmd>lua require("spectre").toggle()<CR>',                             desc = "Toggle Spectre" },
        { "<leader>sw", '<cmd>lua require("spectre").open_visual({select_word=true})<CR>',      desc = "Search current word" },
        { "<leader>sp", '<cmd>lua require("spectre").open_file_search({select_word=true})<CR>', desc = "Search on current file" },
    },
    opts = {
        open_cmd         = 'noswapfile vnew',
        live_update      = false,
        lnum_for_results = true,
        line_sep_start   = '┌-----------------------------------------',
        result_padding   = '¦                                         ',
        line_sep         = '└-----------------------------------------',
        highlight        = {
            ui = "String",
            search = "DiffChange",
            replace = "DiffDelete"
        },
    },
    config = function(_, opts)
        require('spectre').setup(opts)
    end,
}
