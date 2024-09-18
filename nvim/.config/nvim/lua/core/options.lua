local opt = vim.opt

local options = {
    softtabstop = 4,
    tabstop = 4,
    shiftwidth = 4,
    expandtab = true,
    smartindent = true,
    hlsearch = true,
    ignorecase = true,
    smartcase = true,
    showmode = true,
    number = true,
    relativenumber = true,
    signcolumn = 'yes',
    termguicolors = true,
    cursorline = true,
    mouse = nil,
    undofile = true,
    encoding = "utf-8",
    updatetime = 250,
    completeopt = 'menuone,noselect',
    foldcolumn = '1',
    foldlevel = 99,
    foldlevelstart = 99,
    foldenable = true,
    maxmempattern = 2000000,
}

for k, v in pairs(options) do
    opt[k] = v
end

opt.fillchars = {
    eob = " ",
    fold = "⠀",
    foldsep = " ",
    foldclose = "",
    foldopen = "",
}

vim.api.nvim_create_autocmd("BufEnter", {
    pattern = "*",
    callback = function()
        vim.opt_local.formatoptions:remove({ 'c', 'r', 'o' })
    end,
})
