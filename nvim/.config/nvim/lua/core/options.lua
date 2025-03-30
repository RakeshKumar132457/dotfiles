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
        undolevels = 100000,
        splitbelow = true,
        splitright = true,
        scrolloff = 10,
        winminwidth = 5,
        wildmenu = true,
        wildmode = 'longest:full,full',
        pumheight = 10,
        inccommand = 'split',
        wrap = true
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
end

return M
