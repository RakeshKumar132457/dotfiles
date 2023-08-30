-- ~/.config/nvim/lua/plugins/config/rust_tools_config.lua

local rust_tools_config = {}

function rust_tools_config.setup()
    -- Custom on_attach function
    local function on_attach(client, bufnr)
        -- Your existing on_attach function, if any
        -- Set up :RustHoverActions keybind
        vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>rh', ':RustHoverActions<CR>', { noremap = true, silent = true })
    end

    -- Configuration options for rust-tools.nvim
    local opts = {
        tools = {
            autoSetHints = true,
            runnables = {
                use_telescope = true
            },
            inlay_hints = {
                show_parameter_hints = true,
                parameter_hints_prefix = "<- ",
                other_hints_prefix = "=> ",
                max_len_align = false,
                align = "left",
                only_current_line = false
            },
        },
        server = {
            cmd = { "rust-analyzer" },
            on_attach = on_attach,
            settings = {
                ["rust-analyzer"] = {
                    assist = {
                        importMergeBehavior = "last",
                        importPrefix = "by_self",
                    },
                    cargo = {
                        loadOutDirsFromCheck = true,
                    },
                    procMacro = {
                        enable = true,
                    },
                },
            },
        }
    }

    -- Setup rust-tools.nvim with the above options
    require('rust-tools').setup(opts)
end

return rust_tools_config
