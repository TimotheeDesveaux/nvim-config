return {
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        lazy = false,
        keys = {
            { "<leader>s", desc = "start incremental selection" },
        },
        opts = {
            ensure_installed = { "c", "lua", "vim", "vimdoc" },
            auto_install = true,
            highlight = { enable = true },
            indent = { enable = true },
            incremental_selection = {
                enable = true,
                keymaps = {
                    init_selection = "<leader>s",
                    node_incremental = "<Space>",
                    scope_incremental = false,
                    node_decremental = "<BS>",
                },
            },
        },
        config = function(_, opts)
            require("nvim-treesitter.configs").setup(opts)
        end,
    },
    {
        "stevearc/conform.nvim",
        event = "BufWrite",
        keys = {
            {
                "<leader>ot",
                function()
                    vim.g.autoformat = not vim.g.autoformat
                    vim.notify(
                        "Auto format " .. (vim.g.autoformat and "enabled" or "disabled"),
                        vim.log.levels.INFO,
                        { title = "Formatter" }
                    )
                end,
                desc = "toggle",
            },
            {
                "<leader>ob",
                function()
                    local get_or_default = require("custom.utils").get_or_default
                    vim.b.autoformat = not get_or_default(vim.b.autoformat, vim.g.autoformat)
                    vim.notify(
                        "Buffer Auto format " .. (vim.b.autoformat and "enabled" or "disabled"),
                        vim.log.levels.INFO,
                        { title = "Formatter" }
                    )
                end,
                desc = "buffer toggle",
            },
            {
                "<leader>of",
                function()
                    require("conform").format({ async = true })
                end,
                desc = "format buffer",
            },
        },
        opts = {
            formatters_by_ft = {
                lua = { "stylua" },
                c = { "clang-format" },
                cpp = { "clang-format" },
                javascript = { "prettier" },
                typescript = { "prettier" },
                json = { "prettier" },
                yaml = { "prettier" },
                python = { "black" },
                rust = { "rustfmt" },
                nix = { "nixpkgs_fmt" },
                go = { "gofmt" },
            },
            default_format_opts = {
                lsp_format = "never",
            },
            format_on_save = function(bufnr)
                local get_or_default = require("custom.utils").get_or_default
                if get_or_default(vim.b.autoformat, vim.g.autoformat) then
                    return { timeout_ms = 500 }
                end
            end,
        },
        init = function()
            vim.g.autoformat = true
        end,
    },
}
