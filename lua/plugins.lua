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

    -- https://github.com/nvim-lua/completion-nvim
     use {
        'nvim-lua/completion-nvim',
       requires = {'steelsojka/completion-buffers'}
    }

    -- https://github.com/jiangmiao/auto-pairs
    use 'jiangmiao/auto-pairs'

    -- https://github.com/tpope/vim-surround
    use 'tpope/vim-surround'

    -- https://github.com/preservim/nerdcommenter
    use 'preservim/nerdcommenter'

    -- https://github.com/rhysd/vim-clang-format
    use 'rhysd/vim-clang-format'

    -- https://github.com/itchyny/lightline.vim
    use 'itchyny/lightline.vim'

    -- https://github.com/RRethy/vim-hexokinase
    use {'rrethy/vim-hexokinase', run = 'make hexokinase' }

    -- https://github.com/dag/vim-fish
    use 'dag/vim-fish'

    -- https://github.com/glepnir/dashboard-nvim
    use 'glepnir/dashboard-nvim'

    -- https://github.com/liuchengxu/vim-which-key
     use 'liuchengxu/vim-which-key'

end)
