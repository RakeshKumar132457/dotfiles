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
        callback = function()
            local dir = vim.fn.expand("<afile>:p:h")
            if vim.fn.isdirectory(dir) == 0 then
                vim.fn.mkdir(dir, "p")
            end
        end,
        desc = "Auto-create parent directories",
    })
end

return M
