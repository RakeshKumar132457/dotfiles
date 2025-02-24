return {
    "nvim-neotest/neotest",
    lazy = true,
    dependencies = {
        "nvim-neotest/nvim-nio",
        "nvim-lua/plenary.nvim",
        "nvim-treesitter/nvim-treesitter",
        "nvim-neotest/neotest-jest",
    },
    keys = {
        { "<leader>tr", function() require("neotest").run.run() end,                   desc = '[T]est [R]un' },
        { "<leader>tf", function() require("neotest").run.run(vim.fn.expand("%")) end, desc = '[T]est [F]ile' },
        { "<leader>tl", function() require("neotest").run.run_last() end,              desc = '[T]est [L]ast' },
        { "<leader>ts", function() require("neotest").summary.toggle() end,            desc = '[T]est [S]ummary' },
        { "<leader>to", function() require("neotest").output.open() end,               desc = '[T]est [O]utput' },
    },
    config = function()
        require("neotest").setup({
            adapters = {
                require("neotest-jest")({
                    jestCommand = "npm test --",
                    jestConfigFile = "custom.jest.config.ts",
                    env = { CI = true },
                    cwd = function(path)
                        return vim.fn.getcwd()
                    end,
                }),
            }
        })
    end
}

