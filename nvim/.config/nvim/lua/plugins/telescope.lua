return {
    "nvim-telescope/telescope.nvim",
    cmd = { "Telescope" }, -- Lazy load on command
    dependencies = {
        "nvim-lua/plenary.nvim",
        "debugloop/telescope-undo.nvim",
        {
            "nvim-telescope/telescope-fzf-native.nvim",
            build =
            "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build",
            cond = vim.fn.executable("cmake") == 1, -- Only install if cmake is available
        }
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
                    "--trim", -- Can remove this if not needed for performance
                    -- Exclude unnecessary files
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
                        ["<M-p>"] = action_layout.toggle_preview, -- Normal mode mapping for preview toggle
                    },
                    i = {
                        ["<M-p>"] = action_layout.toggle_preview, -- Insert mode mapping for preview toggle
                    },
                },
                file_ignore_patterns = { -- Extra ignore patterns to exclude
                    "node_modules",
                    ".git/",
                    "build/",
                    "dist/",
                },
            },
            pickers = {
                find_files = {
                    hidden = true, -- Search hidden files
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

        -- Load additional extensions
        require('telescope').load_extension('undo') -- Load the undo extension

        if vim.fn.executable("cmake") == 1 then
            require('telescope').load_extension('fzf') -- Conditionally load fzf-native if cmake is available
        end
    end
}
