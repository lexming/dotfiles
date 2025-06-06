return {
    {
        "williamboman/mason.nvim",
        opts = {
            ensure_installed = {
                "bashls",    -- bash
                "cssls",     -- css
                "lua_ls",    -- lua
                "marksman",  -- markdown
                "ruff",      -- python
                "taplo",     -- toml
            },
        },
    },
    { "williamboman/mason-lspconfig.nvim" },
    { "neovim/nvim-lspconfig" },
}
