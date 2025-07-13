return {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
        local harpoon = require('harpoon')
        harpoon:setup()
    end,
    keys = {
        { "<leader>a",  function() require("harpoon"):list():add() end,                                    desc = "Harpoon Add File" },
        { "<leader>df", function() require("harpoon"):list():remove() end,                                 desc = "[D]elete Harpoon [F]ile" },
        { "<leader>hm", function() require("harpoon").ui:toggle_quick_menu(require("harpoon"):list()) end, desc = "[H]arpoon Toggle [M]enu" },
        { "<C-a>",      function() require("harpoon"):list():prev() end,                                   desc = "Harpoon Prev File" },
        { "<C-s>",      function() require("harpoon"):list():next() end,                                   desc = "Harpoon Next File" },
    },
    lazy = true
}
