return {
    "stevearc/aerial.nvim",
    dependencies = {
        "nvim-treesitter/nvim-treesitter",
        "nvim-tree/nvim-web-devicons"
    },
    event = "VeryLazy",
    opts = {
        on_attach = function(bufnr)
            vim.keymap.set("n", "{", "<cmd>AerialPrev<CR>", { buffer = bufnr })
            vim.keymap.set("n", "}", "<cmd>AerialNext<CR>", { buffer = bufnr })
        end,
    },
    keys = {
        { "<leader>to", "<cmd>AerialToggle! left<CR>", desc = "[T]oggle [O]utline Sidebar" },
    },
}
