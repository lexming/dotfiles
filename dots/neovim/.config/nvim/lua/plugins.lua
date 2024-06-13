return require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'
    -- [[ General ]]
    use {
        'vladdoster/remember.nvim',
        config = [[ require('remember') ]],
    }
    -- [[ Theming ]]
    use "lukas-reineke/indent-blankline.nvim"
    use "EdenEast/nightfox.nvim"
    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'kyazdani42/nvim-web-devicons', opt = true }
    }
    use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}
    -- [[ LSP ]]
    use {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "neovim/nvim-lspconfig",
    }
    -- [[ git ]]
    use "rhysd/git-messenger.vim"
    use "lewis6991/gitsigns.nvim"
    use {
        "rawnly/gist.nvim",
        config = function() require("gist").setup() end,
        -- `GistsList` opens the selected gif in a terminal buffer,
        -- this plugin uses neovim remote rpc functionality to open the gist in an actual buffer and not have buffer inception
        requires = { "samjwill/nvim-unception", setup = function() vim.g.unception_block_while_host_edits = true end }
    }
end)
