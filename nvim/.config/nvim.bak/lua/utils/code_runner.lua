-- ~/.config/nvim/code_runner.lua

local M = {}

-- Table to store commands for each file type
local commands = {
    cpp =
    "clang++ -std=c++17 -Wall -Wextra -pedantic -Wshadow -Wformat=2 -Wfloat-equal -Wconversion -Wshift-overflow -Wcast-qual -Wcast-align -D_GLIBCXX_DEBUG -D_GLIBCXX_DEBUG_PEDANTIC -D_FORTIFY_SOURCE=2 -fsanitize=undefined -fno-sanitize-recover -fstack-protector -fsanitize=address -O2 -g %s -o %s.out && ./%s.out",
    c = "clang -Wall -Wextra -Wpedantic -fsanitize=address -O2 -g %s -o %s.out && ./%s.out",
    py = "python %s",
    lua = "lua %s",
    js = "node %s",
    go = "go run .",
    rs = "cargo run"
}

-- Function to set or override the command for a specific file type
function M.set_command(filetype, cmd)
    commands[filetype] = cmd
end

-- Function to run the code based on the file type
function M.run()
    local file_ext = vim.fn.expand('%:e')
    local file_name = vim.fn.expand('%')
    local file_name_without_ext = vim.fn.expand("%:r")

    local command = commands[file_ext]
    if not command then
        print(string.format("Please specify command for '%s' file type in 'code_runner.lua'", file_ext))
        return
    end

    -- Replace placeholders with actual values
    command = string.format(command, file_name, file_name_without_ext, file_name_without_ext)
    vim.cmd("TermExec cmd='" .. command .. "'")
end

return M
