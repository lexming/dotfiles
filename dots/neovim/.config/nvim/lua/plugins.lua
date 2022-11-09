return require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'
    -- [[ General ]]
    use "nathom/filetype.nvim"
    -- [[ Theming ]]
    use "lukas-reineke/indent-blankline.nvim"
    use "EdenEast/nightfox.nvim"
    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'kyazdani42/nvim-web-devicons', opt = true }
    }
    use {
        'nvim-treesitter/nvim-treesitter',
        run = function() require('nvim-treesitter.install').update({ with_sync = true }) end,
    }
    -- [[ LSP ]]
    use {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "neovim/nvim-lspconfig",
    }
end)
