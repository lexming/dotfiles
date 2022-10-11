return require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'
    -- [[ Theming ]]
    use "lukas-reineke/indent-blankline.nvim"
    use "EdenEast/nightfox.nvim"
    use {
        'nvim-treesitter/nvim-treesitter',
        run = function() require('nvim-treesitter.install').update({ with_sync = true }) end,
    }
end)
