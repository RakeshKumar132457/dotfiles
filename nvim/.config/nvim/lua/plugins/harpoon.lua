return {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
        local harpoon = require('harpoon')
        harpoon:setup()
        vim.keymap.set("n", "<leader>a", function() harpoon:list():add() end,
            { desc = "Harpoon Add File" })
        vim.keymap.set("n", "<leader>df", function() harpoon:list():remove() end,
            { desc = "[D]elete Harpoon [F]ile" })
        vim.keymap.set("n", "<leader>hm", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end,
            { desc = "[H]arpoon Toggle [M]enu" })
        vim.keymap.set("n", "<C-a>", function() harpoon:list():prev() end,
            { desc = "Harpoon Prev File" })
        vim.keymap.set("n", "<C-s>", function() harpoon:list():next() end,
            { desc = "Harpoon Next File" })
    end,
    lazy = false
}
