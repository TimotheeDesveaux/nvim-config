return require("packer").startup(function(use)

    -- https://github.com/wbthomason/packer.nvim
    use "wbthomason/packer.nvim"

    -- https://github.com/nvim-treesitter/nvim-treesitter
    use {
        "nvim-treesitter/nvim-treesitter",
        run = ":TSUpdate",
        config = function()
            require("plugins.treesitter")
        end
    }

    -- https://github.com/folke/tokyonight.nvim
    use {
        "folke/tokyonight.nvim",
        config = function()
            require("plugins.colorscheme")
        end
    }

    -- https://github.com/nvim-telescope/telescope.nvim
    use {
        "nvim-telescope/telescope.nvim",
        requires = {"nvim-lua/popup.nvim", "nvim-lua/plenary.nvim"},
        config = function()
            require("plugins.telescope")
        end
    }

    -- https://github.com/neovim/nvim-lspconfig
    use "neovim/nvim-lspconfig"

    -- https://github.com/glepnir/lspsaga.nvim
    use "glepnir/lspsaga.nvim"

    -- https://github.com/L3MON4D3/LuaSnip
    use {
        "L3MON4D3/LuaSnip",
        requires = "rafamadriz/friendly-snippets",
        config = function()
            require("plugins.snippets")
        end
    }

    -- https://github.com/hrsh7th/nvim-cmp
    use {
        "hrsh7th/nvim-cmp",
        requires = {
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-path",
            "saadparwaiz1/cmp_luasnip",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-calc"
        },
        config = function()
            require("plugins.completion")
        end
    }

    -- https://github.com/windwp/nvim-autopairs
    use {
        "windwp/nvim-autopairs",
        config = function()
            require("plugins.autopairs")
        end
    }

    -- https://github.com/tpope/vim-surround
    use "tpope/vim-surround"

    -- https://github.com/preservim/nerdcommenter
    use {
        "preservim/nerdcommenter",
        config = function()
            require("plugins.nerdcommenter")
        end
    }

    -- https://github.com/hoob3rt/lualine.nvim
    use {
        "hoob3rt/lualine.nvim",
        requires = {
            "kyazdani42/nvim-web-devicons",
            opt = true
        },
        config = function()
            require("plugins.statusline")
        end
    }

    -- https://github.com/RRethy/vim-hexokinase
    use {
        "rrethy/vim-hexokinase",
        run = "make hexokinase"
    }

    -- https://github.com/glepnir/dashboard-nvim
    use {
        "glepnir/dashboard-nvim",
        config = function()
            require("plugins.dashboard")
        end
    }

    -- https://github.com/folke/which-key.nvim
    use {
        "folke/which-key.nvim",
        config = function()
            require("plugins.which-key")
        end
    }

    -- https://github.com/lukas-reineke/indent-blankline.nvim
    use {
        "lukas-reineke/indent-blankline.nvim",
        config = function()
            require("plugins.indent-blankline")
        end
    }

    -- https://github.com/kyazdani42/nvim-tree.lua
    use {
        "kyazdani42/nvim-tree.lua",
        config = function()
            require("plugins.tree")
        end
    }

    -- https://github.com/windwp/nvim-projectconfig
    use {
        "windwp/nvim-projectconfig",
        config = function()
            require("plugins.projectconfig")
        end,
        after = "dashboard-nvim"
    }

    -- https://github.com/lukas-reineke/format.nvim
    use {
        "lukas-reineke/format.nvim",
        config = function()
            require("plugins.formatter")
        end
    }

    -- https://github.com/akinsho/bufferline.nvim",
    use {
        "akinsho/bufferline.nvim",
        requires = "kyazdani42/nvim-web-devicons",
        config = function()
            require("plugins.tabs")
        end
    }

end)
