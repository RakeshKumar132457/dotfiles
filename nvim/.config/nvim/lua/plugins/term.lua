return {
    'akinsho/toggleterm.nvim',
    cmd = { 'ToggleTerm', 'TermExec' },
    keys = {
        { "<leader>tt", "<cmd>ToggleTerm<cr>", desc = "Toggle terminal" },
    },
    opts = {
        persist_mode = true,
        winbar = {
            enabled = true,
        },
        open_mapping = [[<c-\>]],
        shade_terminals = false,
    },
    version = "*",
}

