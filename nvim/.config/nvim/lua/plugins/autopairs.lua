return {
    "windwp/nvim-autopairs",
    event = { "InsertEnter" },
    dependencies = {
        {
            "windwp/nvim-ts-autotag",
            ft = { 'html', 'javascript.jsx', 'javascriptreact', 'typescript.tsx', 'typescriptreact', 'xml' },
        },
    },
}
