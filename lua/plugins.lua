return require('packer').startup(function(use)

    -- https://github.com/wbthomason/packer.nvim
    use 'wbthomason/packer.nvim'

    -- https://github.com/nvim-treesitter/nvim-treesitter
    use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }

    -- https://github.com/folke/tokyonight.nvim
    use 'folke/tokyonight.nvim'

    -- https://github.com/nvim-telescope/telescope.nvim
    use {
        'nvim-telescope/telescope.nvim',
        requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}}
    }

    -- https://github.com/neovim/nvim-lspconfig
    use 'neovim/nvim-lspconfig'

    -- https://github.com/glepnir/lspsaga.nvim
    use 'glepnir/lspsaga.nvim'

    -- https://github.com/hrsh7th/nvim-compe
    use 'hrsh7th/nvim-compe'

    -- https://github.com/windwp/nvim-autopairs
    use 'windwp/nvim-autopairs'

    -- https://github.com/tpope/vim-surround
    use 'tpope/vim-surround'

    -- https://github.com/preservim/nerdcommenter
    use 'preservim/nerdcommenter'

    -- https://github.com/rhysd/vim-clang-format
    use 'rhysd/vim-clang-format'

    -- https://github.com/hoob3rt/lualine.nvim
    use {
        'hoob3rt/lualine.nvim',
        requires = {'kyazdani42/nvim-web-devicons', opt = true}
    }

    -- https://github.com/RRethy/vim-hexokinase
    use {'rrethy/vim-hexokinase', run = 'make hexokinase' }

    -- https://github.com/glepnir/dashboard-nvim
    use 'glepnir/dashboard-nvim'

    -- https://github.com/folke/which-key.nvim
    use 'folke/which-key.nvim'

    -- https://github.com/dag/vim-fish
    use 'dag/vim-fish'

end)
