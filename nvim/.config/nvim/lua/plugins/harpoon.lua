return {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },
    keys = {
        { "<leader>a",  function() require("harpoon"):list():add() end,                                    desc = "Harpoon: Add file" },
        { "<leader>df", function() require("harpoon"):list():remove() end,                                 desc = "Harpoon: [D]elete [F]ile" },
        { "<leader>hm", function() require("harpoon").ui:toggle_quick_menu(require("harpoon"):list()) end, desc = "[H]arpoon [M]enu" },
        { "<C-a>",      function() require("harpoon"):list():prev() end,                                   desc = "Harpoon: Previous" },
        { "<C-s>",      function() require("harpoon"):list():next() end,                                   desc = "Harpoon: Next" },
        { "<leader>h1", function() require("harpoon"):list():select(1) end,                                desc = "Harpoon: File 1" },
        { "<leader>h2", function() require("harpoon"):list():select(2) end,                                desc = "Harpoon: File 2" },
        { "<leader>h3", function() require("harpoon"):list():select(3) end,                                desc = "Harpoon: File 3" },
        { "<leader>h4", function() require("harpoon"):list():select(4) end,                                desc = "Harpoon: File 4" },
    },
    config = function()
        require("harpoon"):setup()
    end,
}
