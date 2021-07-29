return require('packer').startup(function(use)

    -- https://github.com/wbthomason/packer.nvim
    use 'wbthomason/packer.nvim'

    -- https://github.com/nvim-treesitter/nvim-treesitter
    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate',
        config = function()
            require('plugins.treesitter')
        end
    }

    -- https://github.com/folke/tokyonight.nvim
    use {
        'folke/tokyonight.nvim',
        config = function()
            require('plugins.colorscheme')
        end
    }

    -- https://github.com/nvim-telescope/telescope.nvim
    use {
        'nvim-telescope/telescope.nvim',
        requires = {
            {'nvim-lua/popup.nvim'},
            {'nvim-lua/plenary.nvim'}
        },
        config = function()
            require('plugins.telescope')
        end
    }

    -- https://github.com/neovim/nvim-lspconfig
    use 'neovim/nvim-lspconfig'

    -- https://github.com/glepnir/lspsaga.nvim
    use 'glepnir/lspsaga.nvim'

    -- https://github.com/hrsh7th/nvim-compe
    use {
        'hrsh7th/nvim-compe',
        config = function()
            require('plugins.completion')
        end
    }

    -- https://github.com/windwp/nvim-autopairs
    use {
        'windwp/nvim-autopairs',
        config = function()
            require('plugins.autopairs')
        end
    }

    -- https://github.com/tpope/vim-surround
    use 'tpope/vim-surround'

    -- https://github.com/preservim/nerdcommenter
    use {
        'preservim/nerdcommenter',
        config = function()
            require('plugins.nerdcommenter')
        end
    }

    -- https://github.com/rhysd/vim-clang-format
    use {
        'rhysd/vim-clang-format',
        config = function()
            vim.cmd('source ~/.config/nvim/vimscript/clang-format.vim')
        end
    }

    -- https://github.com/hoob3rt/lualine.nvim
    use {
        'hoob3rt/lualine.nvim',
        requires = { 'kyazdani42/nvim-web-devicons', opt = true },
        config = function()
            require('plugins.statusline')
        end
    }

    -- https://github.com/RRethy/vim-hexokinase
    use {
        'rrethy/vim-hexokinase',
        run = 'make hexokinase'
    }

    -- https://github.com/glepnir/dashboard-nvim
    use {
        'glepnir/dashboard-nvim',
        config = function()
            require('plugins.dashboard')
        end
    }

    -- https://github.com/folke/which-key.nvim
    use {
        'folke/which-key.nvim',
        config = function()
            require('plugins.which-key')
        end
    }

    -- https://github.com/dag/vim-fish
    use 'dag/vim-fish'

end)
