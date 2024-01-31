-- ~/.config/nvim/lua/plugins/config/rust_tools_config.lua

local general_config = require('lsp.general.config')
local rust_tools_config = {}

function rust_tools_config.setup()
    local on_attach = general_config.on_attach


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
