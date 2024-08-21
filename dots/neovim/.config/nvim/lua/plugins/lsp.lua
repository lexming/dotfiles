return {
    {
        "williamboman/mason.nvim",
        opts = {
            ensure_installed = { "bashls", "ruff" },
        },
    },
    { "williamboman/mason-lspconfig.nvim" },
    { "neovim/nvim-lspconfig" },
}
