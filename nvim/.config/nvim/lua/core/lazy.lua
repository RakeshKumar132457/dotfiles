local lazy_nvim_path = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

-- Check if lazy.nvim is cloned, if not, clone it
if not vim.loop.fs_stat(lazy_nvim_path) then
    local clone_cmd = string.format(
        "git clone --depth=1 --branch=stable https://github.com/folke/lazy.nvim.git %s",
        lazy_nvim_path
    )
    local result = vim.fn.system(clone_cmd)

    if vim.v.shell_error ~= 0 then
        error("Failed to clone lazy.nvim: " .. result)
    end
end

vim.opt.rtp:prepend(lazy_nvim_path)

local lazy = require('lazy')
lazy.setup({ { import = "plugins" } })
