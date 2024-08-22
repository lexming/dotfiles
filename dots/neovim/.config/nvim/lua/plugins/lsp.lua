return {
    {
        "williamboman/mason.nvim",
        opts = {
            ensure_installed = { "bashls", "lua_ls", "ruff" },
        },
    },
    { "williamboman/mason-lspconfig.nvim" },
    { "neovim/nvim-lspconfig" },
}
