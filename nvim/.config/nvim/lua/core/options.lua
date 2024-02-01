vim.o.softtabstop = 4
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true
vim.o.smartindent = true
vim.o.hlsearch = true
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.showmode = true
vim.o.number = true
vim.o.relativenumber = true
vim.o.signcolumn = 'yes'
vim.o.termguicolors = true
vim.o.cursorline = true
vim.o.mouse = nil
vim.o.undofile = true
vim.o.encoding = "utf-8"
vim.o.updatetime = 250
vim.o.completeopt = 'menuone,noselect'
vim.cmd("autocmd BufEnter * set formatoptions-=cro")
vim.cmd("autocmd BufEnter * setlocal formatoptions-=cro")

-- vim.o.showtabline = 2

