return require("packer").startup(function(use)
    -- https://github.com/wbthomason/packer.nvim
    use("wbthomason/packer.nvim")

    -- https://github.com/nvim-treesitter/nvim-treesitter
    use({
        "nvim-treesitter/nvim-treesitter",
        run = ":TSUpdate",
        requires = {
            { "nvim-treesitter/playground" },
            { "windwp/nvim-ts-autotag" },
        },
        config = function()
            require("plugins.treesitter")
        end,
    })

    -- https://github.com/folke/tokyonight.nvim
    use({
        "folke/tokyonight.nvim",
        config = function()
            require("plugins.colorscheme")
        end,
    })

    -- https://github.com/nvim-telescope/telescope.nvim
    use({
        "nvim-telescope/telescope.nvim",
        requires = {
            { "nvim-lua/plenary.nvim" },
            { "nvim-telescope/telescope-fzf-native.nvim", run = "make" },
            { "nvim-tree/nvim-web-devicons" },
        },
        config = function()
            require("plugins.telescope")
        end,
        after = "which-key.nvim",
    })

    -- https://github.com/neovim/nvim-lspconfig
    use("neovim/nvim-lspconfig")

    -- https://github.com/simrat39/rust-tools.nvim
    use("simrat39/rust-tools.nvim")

    -- https://github.com/onsails/lspkind.nvim
    use("onsails/lspkind.nvim")

    -- https://github.com/kosayoda/nvim-lightbulb
    use("kosayoda/nvim-lightbulb")

    -- https://github.com/mfussenegger/nvim-dap
    use({
        "rcarriga/nvim-dap-ui",
        requires = { "mfussenegger/nvim-dap" },
        config = function()
            require("plugins.dap")
        end,
    })

    -- https://github.com/L3MON4D3/LuaSnip
    use({
        "L3MON4D3/LuaSnip",
        config = function()
            require("plugins.snippets")
        end,
    })

    -- https://github.com/hrsh7th/nvim-cmp
    use({
        "hrsh7th/nvim-cmp",
        requires = {
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-nvim-lua",
            "hrsh7th/cmp-path",
            "saadparwaiz1/cmp_luasnip",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-calc",
            "hrsh7th/cmp-cmdline",
            "hrsh7th/cmp-nvim-lsp-signature-help",
        },
        config = function()
            require("plugins.completion")
        end,
    })

    -- https://github.com/stevearc/dressing.nvim
    use({
        "stevearc/dressing.nvim",
        config = function()
            require("plugins.dressing")
        end,
    })

    -- https://github.com/windwp/nvim-autopairs
    use({
        "windwp/nvim-autopairs",
        config = function()
            require("plugins.autopairs")
        end,
    })

    -- https://github.com/kylechui/nvim-surround
    use({
        "kylechui/nvim-surround",
        config = function()
            require("plugins.surround")
        end,
    })

    -- https://github.com/numToStr/Comment.nvim
    use({
        "numToStr/Comment.nvim",
        config = function()
            require("plugins.comments")
        end,
    })

    -- https://github.com/jinh0/eyeliner.nvim
    use({
        "jinh0/eyeliner.nvim",
        config = function()
            require("plugins.eyeliner")
        end,
    })

    -- https://github.com/nvim-lualine/lualine.nvim
    use({
        "nvim-lualine/lualine.nvim",
        requires = { "nvim-tree/nvim-web-devicons" },
        config = function()
            require("plugins.statusline")
        end,
    })

    -- https://github.com/goolord/alpha-nvim
    use({
        "goolord/alpha-nvim",
        config = function()
            require("plugins.startup")
        end,
    })

    -- https://github.com/folke/which-key.nvim
    use({
        "folke/which-key.nvim",
        config = function()
            require("mappings")
        end,
    })

    -- https://github.com/lukas-reineke/indent-blankline.nvim
    use({
        "lukas-reineke/indent-blankline.nvim",
        config = function()
            require("plugins.indent_blankline")
        end,
    })

    -- https://github.com/nvim-tree/nvim-tree.lua
    use({
        "nvim-tree/nvim-tree.lua",
        requires = "nvim-tree/nvim-web-devicons",
        config = function()
            require("plugins.tree")
        end,
        after = "which-key.nvim",
    })

    -- https://github.com/windwp/nvim-projectconfig
    use({
        "windwp/nvim-projectconfig",
        config = function()
            require("plugins.projectconfig")
        end,
        after = "alpha-nvim",
    })

    -- https://github.com/mhartington/formatter.nvim
    use({
        "mhartington/formatter.nvim",
        config = function()
            require("plugins.formatter")
        end,
    })

    -- https://github.com/TimUntersberger/neogit
    use({
        "TimUntersberger/neogit",
        requires = "nvim-lua/plenary.nvim",
        config = function()
            require("plugins.git")
        end,
    })
end)
