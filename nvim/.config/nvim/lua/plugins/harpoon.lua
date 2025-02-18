return {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
        local harpoon = require('harpoon')
        harpoon:setup()
        vim.keymap.set("n", "<leader>a", function() harpoon:list():add() end,
            { desc = "Harpoon Add File" })
        vim.keymap.set("n", "<C-e>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end,
            { desc = "Harpoon Toggle Menu" })
        vim.keymap.set("n", "<C-a>", function() harpoon:list():prev() end,
            { desc = "Harpoon Prev File" })
        vim.keymap.set("n", "<C-s>", function() harpoon:list():next() end,
            { desc = "Harpoon Next File" })
    end,
    lazy = false
}
