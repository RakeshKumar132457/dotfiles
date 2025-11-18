local M = {}

M.setup = function()
    local opt = vim.opt

    local options = {
        softtabstop = 2,
        tabstop = 4,
        shiftwidth = 2,
        expandtab = true,
        smartindent = true,
        hlsearch = true,
        ignorecase = true,
        smartcase = true,
        showmode = false,
        number = true,
        relativenumber = true,
        signcolumn = 'yes',
        termguicolors = true,
        cursorline = true,
        mouse = "",
        undofile = true,
        updatetime = 250,
        completeopt = 'menuone,noselect',
        maxmempattern = 2000000,
        undolevels = 100000,
        splitbelow = true,
        splitright = true,
        scrolloff = 10,
        winminwidth = 5,
        wildmenu = true,
        wildmode = 'longest:full,full',
        pumheight = 10,
        inccommand = 'split',
        wrap = true,
        foldlevelstart = 99,
        foldenable = true,
        foldlevel = 99,
        foldmethod = "expr",
        foldexpr = 'v:lua.vim.treesitter.foldexpr()',
        foldtext = "",
        foldcolumn = "1",
        timeoutlen = 300,
        clipboard = "unnamedplus",
    }

    for k, v in pairs(options) do
        opt[k] = v
    end

    opt.fillchars:append({
        eob = " ",
        fold = "─",
        foldsep = "│",
        foldclose = "▸",
        foldopen = "▾",
    })
end

return M
