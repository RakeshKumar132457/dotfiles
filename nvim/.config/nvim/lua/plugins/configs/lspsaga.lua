local M = {}

-- LSPSaga is a UI plugin for Neovim's built-in LSP.
-- This configuration customizes its appearance and behavior.
function M.setup()
    local lspsaga_status, lspsaga = pcall(require, 'lspsaga')

    -- If LSPSaga is not installed, exit the setup function
    if not lspsaga_status then
        return
    end

    lspsaga.setup {
        -- UI settings for LSPSaga
        ui = {
            -- Theme for LSPSaga. Currently, only the round theme is available.
            theme = "round",

            -- Border style for the floating windows. Options: 'single', 'double', 'rounded', 'solid', 'shadow'.
            border = "single",

            -- Window blending. 0 means no transparency, while 100 is fully transparent.
            winblend = 0,

            -- Icons for expand and collapse in UI elements
            expand = "",
            collapse = "",

            -- Icons for various UI elements
            preview = " ",
            code_action = "💡",
            diagnostic = "🐞",
            incoming = " ",
            outgoing = " ",

            -- Color scheme for LSPSaga UI elements
            colors = {
                normal_bg = "#1d1536",
                title_bg = "#afd700",
                red = "#e95678",
                magenta = "#b33076",
                orange = "#FF8700",
                yellow = "#f7bb3b",
                green = "#afd700",
                cyan = "#36d0e0",
                blue = "#61afef",
                purple = "#CBA6F7",
                white = "#d1d4cf",
                black = "#1c1c19",
            },

            -- Custom kinds for LSP symbols. You can customize the appearance of different LSP symbol kinds here.
            kind = {
                -- Example: Class = "📦", Function = "🔹"
            },
        },

        -- Finder settings for LSPSaga
        finder = {
            -- Keybindings for the finder
            edit = { "o", "<CR>" },
            vsplit = "s",
            split = "i",
            tabe = "t",
            quit = { "q", "<ESC>" },
        },

        -- Settings for displaying symbols in the window's status bar
        symbol_in_winbar = {
            enable = true,
            separator = "  ",
            hide_keyword = true,
            show_file = true,
            folder_level = 2,
            respect_root = false,
            color_mode = true,
        },

        -- Settings for the call hierarchy feature
        callhierarchy = {
            show_detail = false,
            keys = {
                edit = "e",
                vsplit = "s",
                split = "i",
                tabe = "t",
                jump = "o",
                quit = "q",
                expand_collapse = "u",
            },
        },

        -- Settings for the outline feature
        outline = {
            win_position = "right",
            win_with = "",
            win_width = 30,
            show_detail = true,
            auto_preview = true,
            auto_refresh = true,
            auto_close = true,
            custom_sort = nil,
            keys = {
                jump = "o",
                expand_collapse = "u",
                quit = "q",
            },
        },

        -- Settings for the preview feature
        preview = {
            lines_above = 5,
            lines_below = 10,
        },

        -- Keybindings for scrolling in the preview window
        scroll_preview = {
            scroll_down = "<C-f>",
            scroll_up = "<C-b>",
        },

        -- Maximum time in milliseconds to wait for LSP responses
        request_timeout = 5000,

        -- Additional UI enhancements can be added here. For instance:
        -- 1. Font settings for better readability.
        -- 2. Additional color themes or custom themes.
        -- 3. Animations or transitions for UI elements.
    }
end

return M
