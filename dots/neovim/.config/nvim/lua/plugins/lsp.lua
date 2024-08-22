return {
    {
        "williamboman/mason.nvim",
        opts = {
            ensure_installed = { "bashls", "lua_ls", "marksman", "ruff" },
        },
    },
    { "williamboman/mason-lspconfig.nvim" },
    { "neovim/nvim-lspconfig" },
}
