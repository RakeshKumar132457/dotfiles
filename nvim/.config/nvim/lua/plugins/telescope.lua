return {
    "nvim-telescope/telescope.nvim",
    cmd = "Telescope",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "debugloop/telescope-undo.nvim",
        {
            "nvim-telescope/telescope-fzf-native.nvim",
            build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release",
            cond = function()
                return vim.fn.executable("cmake") == 1
            end,
        }
    },
    keys = {
        { "<leader>sf", "<cmd>Telescope find_files<cr>",                            desc = "[S]earch [F]iles" },
        { "<leader>sg", "<cmd>Telescope live_grep<cr>",                             desc = "[S]earch by [G]rep" },
        { "<leader>ss", "<cmd>Telescope lsp_document_symbols<cr>",                  desc = "[S]earch LSP [S]ymbols" },
        { "<leader>sb", "<cmd>Telescope buffers<cr>",                               desc = "[S]earch [B]uffers" },
        { "<leader>sd", "<cmd>Telescope diagnostics<cr>",                           desc = "[S]earch [D]iagnostics" },
        { "<leader>sr", "<cmd>Telescope oldfiles<cr>",                              desc = "[S]earch [R]ecent files" },
        { "<leader>sk", "<cmd>Telescope keymaps<cr>",                               desc = "[S]earch [K]eymaps" },
        { "<leader>sh", "<cmd>Telescope help_tags<cr>",                             desc = "[S]earch [H]elp" },
        { "<leader>sw", "<cmd>Telescope grep_string<cr>",                           desc = "[S]earch current [W]ord" },
        { "<leader>gr", "<cmd>Telescope lsp_references<cr>",                        desc = "[G]oto [R]eferences" },
        { "<leader>gd", "<cmd>Telescope lsp_definitions<cr>",                       desc = "[G]oto [D]efinition" },
        { "<leader>gi", "<cmd>Telescope lsp_implementations<cr>",                   desc = "[G]oto [I]mplementation" },
        { "<leader>ut", function() require('telescope').extensions.undo.undo() end, desc = "[U]ndo [T]ree" },
        { "<leader>/",  "<cmd>Telescope current_buffer_fuzzy_find<cr>",             desc = "Fuzzy search in buffer" },
    },
    config = function()
        local actions = require("telescope.actions")
        local action_layout = require("telescope.actions.layout")

        require('telescope').setup({
            defaults = {
                prompt_prefix = "   ",
                selection_caret = " ",
                entry_prefix = "  ",
                sorting_strategy = "ascending",
                layout_strategy = "horizontal",
                layout_config = {
                    horizontal = {
                        prompt_position = "top",
                        preview_width = 0.55,
                    },
                    width = 0.87,
                    height = 0.80,
                    preview_cutoff = 120,
                },
                vimgrep_arguments = {
                    "rg",
                    "--color=never",
                    "--no-heading",
                    "--with-filename",
                    "--line-number",
                    "--column",
                    "--smart-case",
                    "--ignore",
                    "--hidden",
                    "--trim",
                    "--glob=!**/.git/*",
                    "--glob=!**/.idea/*",
                    "--glob=!**/.vscode/*",
                    "--glob=!**/build/*",
                    "--glob=!**/dist/*",
                    "--glob=!**/node_modules/*",
                    "--glob=!**/target/*",
                    "--glob=!**/*.lock/*",
                },
                mappings = {
                    n = {
                        ["<M-p>"] = action_layout.toggle_preview,
                        ["q"] = actions.close,
                    },
                    i = {
                        ["<M-p>"] = action_layout.toggle_preview,
                        ["<C-u>"] = false,
                        ["<C-d>"] = false,
                    },
                },
                path_display = { "truncate" },
                winblend = 0,
                border = {},
                borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
                color_devicons = true,
            },
            pickers = {
                find_files = {
                    hidden = true,
                    find_command = {
                        "rg",
                        "--files",
                        "--hidden",
                        "--glob=!**/.git/*",
                        "--glob=!**/node_modules/*",
                        "--glob=!**/target/*",
                    },
                },
            },
        })

        pcall(require('telescope').load_extension, 'undo')
        pcall(require('telescope').load_extension, 'fzf')
    end
}
