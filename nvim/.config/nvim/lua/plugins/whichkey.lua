return {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {
        preset = "modern",
        delay = 300,
        spec = {
            { "<leader>c", group = "[C]ode" },
            { "<leader>d", group = "[D]ocument/Diff" },
            { "<leader>r", group = "[R]ename" },
            { "<leader>s", group = "[S]earch" },
            { "<leader>w", group = "[W]orkspace" },
            { "<leader>t", group = "[T]oggle" },
            { "<leader>h", group = "Git [H]unk",     mode = { "n", "v" } },
            { "<leader>g", group = "[G]oto" },
            { "<leader>x", group = "Diagnostics" },
            { "<leader>f", group = "[F]ile/Format" },
            { "[",         group = "Previous" },
            { "]",         group = "Next" },
            { "g",         group = "Goto" },
        },
    },
}
