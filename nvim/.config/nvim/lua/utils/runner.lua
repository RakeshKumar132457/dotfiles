local M = {}

local function detect_build_system()
    local systems = {
        cmake = 'CMakeLists.txt',
        make = 'Makefile',
        ninja = 'build.ninja',
        meson = 'meson.build'
    }

    for system, file in pairs(systems) do
        if vim.fn.filereadable(file) == 1 then
            return system
        end
    end
    return nil
end

local function get_source_files(filetype)
    local patterns = {
        cpp = { '*.cpp', '*.cc', '*.cxx', '*.c++' },
        c = { '*.c' },
        h = { '*.h', '*.hpp', '*.hxx' }
    }

    local files = {}
    for _, pattern in ipairs(patterns[filetype] or {}) do
        vim.list_extend(files, vim.fn.glob(pattern, false, true))
    end

    return files
end

local function get_compile_command(filetype)
    local build_system = detect_build_system()
    local current_file = vim.fn.expand('%')
    local output_name = vim.fn.expand('%:r')

    if build_system == 'cmake' then
        return string.format("cmake -B build -DCMAKE_BUILD_TYPE=Debug && cmake --build build && ./build/%s", output_name)
    elseif build_system == 'make' then
        return "make && ./" .. output_name
    end

    local source_files = get_source_files(filetype)
    local compile_flags = {
        cpp = "-std=c++17 -Wall -Wextra -pedantic -Wshadow -Wformat=2 -Wfloat-equal -Wconversion -O2 -g",
        c = "-Wall -Wextra -Wpedantic -std=c11 -O2 -g"
    }

    local compiler = filetype == 'cpp' and 'clang++' or 'clang'
    local flags = compile_flags[filetype] or ""

    if #source_files > 1 then
        local files_str = table.concat(source_files, ' ')
        return string.format("%s %s %s -o %s && ./%s", compiler, flags, files_str, output_name, output_name)
    else
        return string.format("%s %s {file} -o {file:r} && ./{file:r}", compiler, flags)
    end
end

local commands = {
    cpp = function() return get_compile_command('cpp') end,
    c = function() return get_compile_command('c') end,
    py = "python3 {file}",
    lua = "lua {file}",
    js = "node {file}",
    go = "go run {file}",
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

    if type(command) == 'function' then
        command = command()
    end

    command = command:gsub('{file}', vim.fn.expand('%'))
    command = command:gsub('{file:r}', vim.fn.expand('%:r'))

    vim.cmd('TermExec cmd="' .. command .. '"')
end
return M
