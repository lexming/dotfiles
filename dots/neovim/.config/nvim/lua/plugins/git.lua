return {
    { "lewis6991/gitsigns.nvim", opts = {} },
    {
        "Rawnly/gist.nvim",
        cmd = { "GistCreate", "GistCreateFromFile", "GistsList" },
        config = true
    },
    -- nvim-unception uses neovim remote rpc functionality to open the gist in an actual buffer
    -- and prevents neovim buffer inception
    {
        "samjwill/nvim-unception",
        lazy = false,
        init = function() vim.g.unception_block_while_host_edits = true end
    },
}
