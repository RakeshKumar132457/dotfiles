local M = {}

M.setup = function()
    local null_ls_ok, null_ls = pcall(require, "null-ls")
    if not null_ls_ok then
        return
    end

    local sources = {
        sources = {
            null_ls.builtins.formatting.black.with({
                extra_args = { "--line-length=120" }
            }),
            null_ls.builtins.formatting.prettier,
            null_ls.builtins.formatting.eslint,

        }
    }

    null_ls.setup({ sources = sources })
end

return M
