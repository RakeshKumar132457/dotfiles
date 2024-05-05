local M = {}

local commands = {
    cpp =
    "clang++ -std=c++17 -Wall -Wextra -pedantic -Wshadow -Wformat=2 -Wfloat-equal -Wconversion -Wshift-overflow -Wcast-qual -Wcast-align -D_GLIBCXX_DEBUG -D_GLIBCXX_DEBUG_PEDANTIC -D_FORTIFY_SOURCE=2 -fsanitize=undefined -fno-sanitize-recover -fstack-protector -fsanitize=address -O2 -g % -o %:r.out && ./%:r.out",
    c = "clang -Wall -Wextra -Wpedantic -fsanitize=address -O2 -g % -o %:r.out && ./%:r.out",
    py = "python3 %",
    lua = "lua %",
    js = "node %",
    go = "go run %",
    rs = "cargo run"
}

function M.set_command(filetype, cmd)
    commands[filetype] = cmd
end

function M.run()
    local file_ext = vim.fn.expand('%:e')
    local command = commands[file_ext]
    if not command then
        print(string.format("Please specify command for '%s' file type in 'code_runner.lua'", file_ext))
        return
    end
    command = command:gsub('%%', vim.fn.expand('%'))
    vim.cmd('TermExec cmd="' .. command .. '"')
end

return M
