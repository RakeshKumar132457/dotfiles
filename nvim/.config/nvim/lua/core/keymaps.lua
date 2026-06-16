local M = {}

M.setup = function()
    local map = vim.keymap.set

    -- Existing
    map({ 'n', 'v' }, '<leader>y', '"+y', { desc = "Yank to system clipboard" })

    -- Recommended additions
    map('n', '<Esc>', '<cmd>nohlsearch<CR>', { desc = "Clear search highlights" })
    map('n', '<leader>q', '<cmd>qa<CR>', { desc = "Quit all" })

    -- Better window navigation
    map('n', '<C-h>', '<C-w>h', { desc = "Go to left window" })
    map('n', '<C-j>', '<C-w>j', { desc = "Go to lower window" })
    map('n', '<C-k>', '<C-w>k', { desc = "Go to upper window" })
    map('n', '<C-l>', '<C-w>l', { desc = "Go to right window" })

    -- Resize windows
    map('n', '<C-Up>', '<cmd>resize +2<CR>', { desc = "Increase window height" })
    map('n', '<C-Down>', '<cmd>resize -2<CR>', { desc = "Decrease window height" })
    map('n', '<C-Left>', '<cmd>vertical resize -2<CR>', { desc = "Decrease window width" })
    map('n', '<C-Right>', '<cmd>vertical resize +2<CR>', { desc = "Increase window width" })

    -- Better indenting
    map('v', '<', '<gv', { desc = "Indent left" })
    map('v', '>', '>gv', { desc = "Indent right" })

    -- Move lines
    map('n', '<A-j>', '<cmd>m .+1<CR>==', { desc = "Move line down" })
    map('n', '<A-k>', '<cmd>m .-2<CR>==', { desc = "Move line up" })
    map('v', '<A-j>', ":m '>+1<CR>gv=gv", { desc = "Move selection down" })
    map('v', '<A-k>', ":m '<-2<CR>gv=gv", { desc = "Move selection up" })

    -- Terminal Mode escape mapping
    map('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = "Exit terminal mode" })

    -- Center cursor on scrolling
    map('n', '<C-d>', '<C-d>zz', { desc = "Scroll down and center cursor" })
    map('n', '<C-u>', '<C-u>zz', { desc = "Scroll up and center cursor" })

    -- Center cursor on search results
    map('n', 'n', 'nzzzv', { desc = "Next search match and center cursor" })
    map('n', 'N', 'Nzzzv', { desc = "Prev search match and center cursor" })

    -- Quickfix list navigation
    map('n', '[q', '<cmd>cprev<cr>', { desc = "Previous quickfix item" })
    map('n', ']q', '<cmd>cnext<cr>', { desc = "Next quickfix item" })

    -- Terminal Mode split window navigation
    map('t', '<C-h>', '<C-\\><C-n><C-w>h', { desc = "Go to left window" })
    map('t', '<C-j>', '<C-\\><C-n><C-w>j', { desc = "Go to lower window" })
    map('t', '<C-k>', '<C-\\><C-n><C-w>k', { desc = "Go to upper window" })
    map('t', '<C-l>', '<C-\\><C-n><C-w>l', { desc = "Go to right window" })

    -- Compile and Run Code (C++, Python, JS/TS)
    local function run_code()
        local file_extension = vim.fn.expand("%:e")
        local file_path = vim.fn.expand("%:p")
        local file_dir = vim.fn.expand("%:p:h")
        local file_name_no_ext = vim.fn.expand("%:t:r")

        if file_extension == "cpp" then
            vim.cmd("split | term cd " .. file_dir .. " && g++ -O2 " .. file_name_no_ext .. ".cpp -o " .. file_name_no_ext .. " && ./" .. file_name_no_ext)
        elseif file_extension == "py" then
            vim.cmd("split | term python3 " .. file_path)
        elseif file_extension == "js" then
            vim.cmd("split | term node " .. file_path)
        elseif file_extension == "ts" then
            vim.cmd("split | term ts-node " .. file_path)
        else
            print("Cannot run: unsupported file type '." .. file_extension .. "'")
        end
    end
    map('n', '<leader>x', run_code, { desc = "Compile/Run active file" })

    -- Diagnostic Navigation
    map('n', '[d', vim.diagnostic.goto_prev, { desc = "Previous diagnostic" })
    map('n', ']d', vim.diagnostic.goto_next, { desc = "Next diagnostic" })
    map('n', '<leader>ce', vim.diagnostic.open_float, { desc = "[C]ode Show [E]rror diagnostics" })

    -- Buffer Navigation
    map('n', '[b', '<cmd>bprevious<cr>', { desc = "Previous buffer" })
    map('n', ']b', '<cmd>bnext<cr>', { desc = "Next buffer" })
    map('n', '<leader>bd', '<cmd>bp|bd #<cr>', { desc = "[B]uffer [D]elete (Keep layout)" })
end

return M
