return {
    "kylechui/nvim-surround",
    event = { "BufReadPost", "BufNewFile" },
    opts = {
        keymaps = {
            insert = "<C-g>s",
            insert_line = "<C-g>S",
            normal = "ys",
            normal_cur = "yss",
            normal_line = "yS",
            normal_cur_line = "ySS",
            visual = "S",
            visual_line = "gS",
            delete = "ds",
            change = "cs",
        },
        aliases = {
            ["a"] = ">",
            ["b"] = ")",
            ["B"] = "}",
            ["r"] = "]",
            ["q"] = { '"', "'", "`" },
            ["s"] = { "}", "]", ")", ">", '"', "'", "`" },
        },
    },
    init = function()
        -- Defer loading of keymaps
        vim.defer_fn(function()
            local km = vim.keymap
            -- Add your most used surround keymaps here
            km.set("n", "ys", "<Plug>(nvim-surround-normal)")
            km.set("n", "ds", "<Plug>(nvim-surround-delete)")
            km.set("n", "cs", "<Plug>(nvim-surround-change)")
        end, 100)
    end,
}

