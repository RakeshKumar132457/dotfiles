local M = {}

M.setup = function()
    -- Format options autocmd
    vim.api.nvim_create_autocmd("BufEnter", {
        pattern = "*",
        callback = function()
            vim.opt_local.formatoptions:remove({ 'c', 'r', 'o' })
        end,
        desc = "Remove auto-commenting on new lines",
    })

    -- Highlight on yank
    vim.api.nvim_create_autocmd("TextYankPost", {
        callback = function()
            vim.highlight.on_yank({ timeout = 200 })
        end,
        desc = "Highlight yanked text",
    })

    -- Auto-create directories when saving
    vim.api.nvim_create_autocmd("BufWritePre", {
        callback = function(event)
            if event.match:match("^%w%w+:[\\/][\\/]") then
                return -- Don't auto-create for remote files
            end
            local file = vim.uv.fs_realpath(event.match) or event.match
            vim.fn.mkdir(vim.fn.fnamemodify(file, ":p:h"), "p")
        end,
        desc = "Auto-create parent directories",
    })

    -- Added: Close certain filetypes with q
    vim.api.nvim_create_autocmd("FileType", {
        pattern = {
            "help",
            "lspinfo",
            "man",
            "qf",
            "checkhealth",
        },
        callback = function(event)
            vim.bo[event.buf].buflisted = false
            vim.keymap.set("n", "q", "<cmd>close<cr>", { buffer = event.buf, silent = true })
        end,
        desc = "Close with q",
    })

    -- Added: Check if file changed outside Neovim
    vim.api.nvim_create_autocmd({ "FocusGained", "TermClose", "TermLeave" }, {
        callback = function()
            if vim.o.buftype ~= "nofile" then
                vim.cmd("checktime")
            end
        end,
        desc = "Check for file changes",
    })

    -- Lazy load clipboard
    vim.api.nvim_create_autocmd("TextYankPost", {
        callback = function()
            if vim.v.event.operator == 'y' then
                vim.opt.clipboard = "unnamedplus" -- Load only when yanking
            end
        end,
        desc = "Lazy load clipboard",
    })

    -- Equalize splits on resize
    vim.api.nvim_create_autocmd("VimResized", {
        pattern = "*",
        command = "tabdo wincmd =",
        desc = "Auto-resize splits on terminal resize",
    })

    -- Restore cursor position
    vim.api.nvim_create_autocmd("BufReadPost", {
        callback = function()
            local mark = vim.api.nvim_buf_get_mark(0, '"')
            local lcount = vim.api.nvim_buf_line_count(0)
            if mark[1] > 0 and mark[1] <= lcount then
                pcall(vim.api.nvim_win_set_cursor, 0, mark)
            end
        end,
        desc = "Go to last location when opening a buffer",
    })
end

return M
