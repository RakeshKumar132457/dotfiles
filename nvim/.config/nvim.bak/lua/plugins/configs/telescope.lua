-- Import the safely_require utility function
local safely_require = require('utils').safely_require

local M = {}

M.setup = function()
    -- Safely try to require the telescope module
    local telescope = safely_require('telescope')

    -- If telescope isn't installed, exit the setup
    if not telescope then
        return
    end

    -- Attempt to load the fzf extension for telescope
    -- The fzf extension provides faster searching capabilities using the fzf algorithm.
    pcall(telescope.load_extension, 'fzf')

    telescope.setup {
        defaults = {
            -- Configuration for the appearance and behavior of the picker

            -- Define the layout of the picker
            layout_config = {
                -- Position the prompt at the top of the picker
                -- This is where you type your search query.
                prompt_position = "top",
                -- Set the width of the picker to 75% of the window width
                width = 0.75,
                -- Cut off file previews after 120 characters
                -- This prevents long lines from occupying too much space.
                preview_cutoff = 120,
            },
            -- Use the "flex" layout strategy for a more flexible appearance
            -- This strategy adapts the layout based on the size of the Neovim window.
            layout_strategy = "flex",
            -- Sort results in ascending order (can also be "descending")
            -- This affects the order in which search results are displayed.
            sorting_strategy = "ascending",
            -- Key mappings for actions within the picker
            mappings = {
                i = {
                    -- These mappings will only be active when the Telescope picker is open.
                    -- Example: Map <C-j> and <C-k> to move selection up and down
                    -- ["<C-j>"] = "move_selection_next",
                    -- ["<C-k>"] = "move_selection_previous",
                    -- Add more mappings here if needed.
                    -- Each mapping corresponds to a specific action in the picker.
                },
            },
        },
    }
end

return M
