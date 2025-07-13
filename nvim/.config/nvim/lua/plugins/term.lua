return {
    'akinsho/toggleterm.nvim',
    cmd = { 'ToggleTerm', 'TermExec' },
    keys = {
        { "<leader>tt", "<cmd>ToggleTerm<cr>",                                                                                                        desc = "[T]oggle [T]erm" },
        { "<leader>tn", function() require("toggleterm.terminal").Terminal:new():open() end,                                                          desc = "[T]erminal [N]ew" },
        { "<leader>lg", function() require('toggleterm.terminal').Terminal:new({ cmd = "lazygit", hidden = true, direction =
            'float' }):toggle() end,                                                                                                                  desc = '[L]azy [G]it' }
    },

    opts = {
        persist_mode = true,
        winbar = {
            enabled = true,
        },
        shade_terminals = false,
    },
}
