local opt = vim.opt
local o = vim.o

o.softtabstop = 4
o.tabstop = 4
o.shiftwidth = 4
o.expandtab = true
o.smartindent = true
o.hlsearch = true
o.ignorecase = true
o.smartcase = true
o.showmode = true
o.number = true
o.relativenumber = true
o.signcolumn = 'yes'
o.termguicolors = true
o.cursorline = true
o.mouse = nil
o.undofile = true
o.encoding = "utf-8"
o.updatetime = 250
o.completeopt = 'menuone,noselect'
o.foldcolumn = '1'
o.foldlevel = 99
o.foldlevelstart = 99
o.foldenable = true
o.maxmempattern = 2000000
-- o.showtabline = 2
-- o.cmdheight = 0

opt.fillchars = {
    eob = " ",
    fold = "⠀",
    foldsep = " ",
    foldclose = "",
    foldopen = "",
}

vim.cmd("autocmd BufEnter * set formatoptions-=cro")
vim.cmd("autocmd BufEnter * setlocal formatoptions-=cro")
