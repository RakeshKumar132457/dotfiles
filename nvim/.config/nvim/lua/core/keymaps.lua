local M = {}

M.setup = function()
    local map = vim.keymap.set
    local default_opts = { noremap = true, silent = true }

    map('n', '<leader>ft', function() require('oil').toggle_float() end,
        { noremap = true, silent = true, desc = "[F]ile [T]ree" })
    map({ 'n', 'v' }, '<leader>y', '"+y', default_opts)
    map('n', '<leader>tt', '<Cmd>ToggleTerm<CR>', { noremap = true, silent = true, desc = '[T]oggle [T]erm' })
    map('n', '<leader>tn', function()
        require("toggleterm.terminal").Terminal:new():open()
    end, { noremap = true, silent = true, desc = '[T]erminal [N]ew' })
    map('n', '<leader>lg', function()
        require('toggleterm.terminal').Terminal:new({ cmd = "lazygit", hidden = true, direction = 'float' }):toggle()
    end, { noremap = true, silent = true, desc = '[L]azy [G]it' })


    local telescope_map = function(key, func, desc)
        map('n', key, function()
            require('telescope.builtin')[func]()
        end, { noremap = true, silent = true, desc = desc })
    end
    local telescope_mappings = {
        { key = '<leader>sf', func = 'find_files',           desc = '[S]earch [F]iles' },
        { key = '<leader>sg', func = 'live_grep',            desc = '[S]earch by [G]rep' },
        { key = '<leader>ss', func = 'lsp_document_symbols', desc = '[S]earch LSP [S]ymbols' },
        { key = '<leader>sb', func = 'buffers',              desc = '[S]earch [B]uffers' },
        { key = '<leader>sd', func = 'diagnostics',          desc = '[S]earch [D]iagnostics' },
        { key = '<leader>sr', func = 'oldfiles',             desc = '[S]earch [R]ecent files' },
        { key = '<leader>sk', func = 'keymaps',              desc = '[S]earch [K]eymaps' },
        { key = '<leader>gr', func = 'lsp_references',       desc = '[G]oto [R]eferences' },
        { key = '<leader>gd', func = 'lsp_definitions',      desc = '[G]oto [D]efinition' },
        { key = '<leader>gi', func = 'lsp_implementations',  desc = '[G]oto [I]mplementation' },
    }
    for _, mapping in ipairs(telescope_mappings) do
        telescope_map(mapping.key, mapping.func, mapping.desc)
    end

    map('n', '<leader>ut', function() require('telescope').extensions.undo.undo() end,
        { noremap = true, silent = true, desc = '[U]ndo [T]ree' })
    map('n', '<leader>cr', ':lua require"utils.runner".run()<CR>', default_opts)
end

return M
