return {
    {
        "mason-org/mason.nvim",
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
    {
        "mason-org/mason-lspconfig.nvim",
        opts = {},
        dependencies = {
            { "mason-org/mason.nvim", opts = {} },
            "neovim/nvim-lspconfig",
        },
    },
    { "neovim/nvim-lspconfig" },
}
