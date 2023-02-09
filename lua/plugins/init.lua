local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    {
        "folke/tokyonight.nvim",
        lazy = false,
        config = function()
            require("plugins.colorscheme")
        end,
    },
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        dependencies = { "nvim-treesitter/playground" },
        config = function()
            require("plugins.treesitter")
        end,
    },
    {
        "folke/which-key.nvim",
        lazy = true,
    },
    {
        "nvim-telescope/telescope.nvim",
        dependencies = {
            { "nvim-lua/plenary.nvim" },
            { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
            { "nvim-tree/nvim-web-devicons" },
        },
        config = function()
            require("plugins.telescope")
        end,
    },
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            "simrat39/rust-tools.nvim",
            "kosayoda/nvim-lightbulb",
        },
    },
    {
        "hrsh7th/nvim-cmp",
        dependencies = {
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-nvim-lua",
            "hrsh7th/cmp-path",
            "saadparwaiz1/cmp_luasnip",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-calc",
            "hrsh7th/cmp-cmdline",
            "hrsh7th/cmp-nvim-lsp-signature-help",
            "onsails/lspkind.nvim",
        },
        config = function()
            require("plugins.completion")
        end,
    },
    {
        "stevearc/dressing.nvim",
        config = function()
            require("plugins.dressing")
        end,
    },
    {
        "L3MON4D3/LuaSnip",
        config = function()
            require("plugins.snippets")
        end,
    },
    {
        "rcarriga/nvim-dap-ui",
        dependencies = { "mfussenegger/nvim-dap" },
        config = function()
            require("plugins.dap")
        end,
    },
    {
        "windwp/nvim-autopairs",
        config = function()
            require("plugins.autopairs")
        end,
    },
    {
        "kylechui/nvim-surround",
        config = function()
            require("plugins.surround")
        end,
    },
    {
        "numToStr/Comment.nvim",
        config = function()
            require("plugins.comment")
        end,
    },
    {
        "jinh0/eyeliner.nvim",
        config = function()
            require("plugins.eyeliner")
        end,
    },
    {
        "lukas-reineke/indent-blankline.nvim",
        config = function()
            require("plugins.indent_blankline")
        end,
    },
    {
        "nvim-lualine/lualine.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        config = function()
            require("plugins.statusline")
        end,
    },
    {
        "goolord/alpha-nvim",
        config = function()
            require("plugins.alpha")
        end,
    },
    {
        "nvim-tree/nvim-tree.lua",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        config = function()
            require("plugins.tree")
        end,
    },
    {
        "mhartington/formatter.nvim",
        config = function()
            require("plugins.formatter")
        end,
    },
    {
        "TimUntersberger/neogit",
        requires = { "nvim-lua/plenary.nvim" },
        config = function()
            require("plugins.neogit")
        end,
    },
    {
        "glacambre/firenvim",
        build = function()
            vim.fn["firenvim#install"](0)
        end,
        config = function()
            require("plugins.firenvim")
        end,
    },
    {
        "windwp/nvim-projectconfig",
        config = function()
            require("plugins.projectconfig")
        end,
    },
})
