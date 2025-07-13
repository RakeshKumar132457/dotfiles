return {
    "nvim-telescope/telescope.nvim",
    cmd = { "Telescope" },
    dependencies = {
        "nvim-lua/plenary.nvim",
        "debugloop/telescope-undo.nvim",
        {
            "nvim-telescope/telescope-fzf-native.nvim",
            build =
            "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build",
            cond = vim.fn.executable("cmake") == 1,
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
        { "<leader>gr", "<cmd>Telescope lsp_references<cr>",                        desc = "[G]oto [R]eferences" },
        { "<leader>gd", "<cmd>Telescope lsp_definitions<cr>",                       desc = "[G]oto [D]efinition" },
        { "<leader>gi", "<cmd>Telescope lsp_implementations<cr>",                   desc = "[G]oto [I]mplementation" },
        { "<leader>ut", function() require('telescope').extensions.undo.undo() end, desc = "[U]ndo [T]ree" },
    },
    config = function()
        local action_layout = require("telescope.actions.layout")
        require('telescope').setup({
            defaults = {
                prompt_prefix = ' ',
                selection_caret = ' ',
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
                    "--glob=!**/yarn.lock",
                    "--glob=!**/package-lock.json",
                    "--glob=!**/node_modules/*",
                },
                mappings = {
                    n = {
                        ["<M-p>"] = action_layout.toggle_preview,
                    },
                    i = {
                        ["<M-p>"] = action_layout.toggle_preview,
                    },
                },
                file_ignore_patterns = {
                    "node_modules",
                    ".git/",
                    "build/",
                    "dist/",
                },
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
                        "--glob=!**/.idea/*",
                        "--glob=!**/.vscode/*",
                        "--glob=!**/build/*",
                        "--glob=!**/dist/*",
                        "--glob=!**/yarn.lock",
                        "--glob=!**/package-lock.json",
                    },
                },
            },
        })

        require('telescope').load_extension('undo')
        require('telescope').load_extension('fzf')
    end
}
