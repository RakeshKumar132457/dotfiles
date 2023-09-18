-- Import the safely_require utility function
local safely_require = require('utils').safely_require

local M = {}

M.setup = function()
    -- Safely try to require the alpha module
    local alpha = safely_require('alpha')
    local alpha_theme = safely_require('alpha.themes.dashboard')

    -- If alpha isn't installed, exit the setup
    if not alpha or not alpha_theme then
        return
    end

    -- Customize the dashboard buttons
    alpha_theme.section.buttons.val = {
        alpha_theme.button("o", " " .. " Open empty file", ":ene<CR>"),
        alpha_theme.button("f", "󰮗 " .. " Find file", ":Telescope find_files<CR>"),
        alpha_theme.button("t", " " .. " File tree", ":NvimTreeToggle <CR>"),
        alpha_theme.button("r", " " .. " Open recent", ":Telescope oldfiles<CR>"),
        alpha_theme.button("w", " " .. " Search for text", ":Telescope live_grep<CR>"),
        alpha_theme.button("b", " " .. " Jump to bookmarks", ":Telescope marks<CR>"),
        alpha_theme.button("q", "󰗼 " .. " Exit", ":q!<CR>"),
    }



    alpha.setup(alpha_theme.config)
end

return M
