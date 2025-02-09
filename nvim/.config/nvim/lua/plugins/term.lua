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
        shade_terminals = false,
    },
    version = "*",
}
