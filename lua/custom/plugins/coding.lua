local get_or_default = require("custom.utils").get_or_default

return {
    {
        "folke/lazydev.nvim",
        ft = "lua",
        opts = {
            library = {
                -- Load luvit types when the `vim.uv` word is found
                { path = "${3rd}/luv/library", words = { "vim%.uv" } },
            },
        },
    },
    {
        "saghen/blink.cmp",
        dependencies = { "L3MON4D3/LuaSnip" },
        event = "InsertEnter",
        version = "*",
        opts = {
            snippets = { preset = "luasnip" },
            keymap = {
                preset = "enter",
                ["<C-Space>"] = { "show" },
                ["<Tab>"] = { "select_next", "fallback" },
                ["<S-Tab>"] = { "select_prev", "fallback" },
            },
            sources = {
                default = { "lazydev", "lsp", "path", "snippets", "buffer" },
                providers = {
                    lazydev = {
                        name = "LazyDev",
                        module = "lazydev.integrations.blink",
                        score_offset = 100,
                    },
                },
            },
            appearance = { use_nvim_cmp_as_default = false },
            signature = { enabled = true },
            completion = {
                list = {
                    selection = { preselect = false, auto_insert = true },
                },
                accept = {
                    auto_brackets = { enabled = true },
                },
                documentation = {
                    auto_show = true,
                    auto_show_delay_ms = 200,
                },
            },
        },
    },
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        lazy = false,
        config = function()
            local augroup = require("custom.utils").augroup

            vim.api.nvim_create_autocmd("FileType", {
                group = augroup("treesitter"),
                pattern = { "*" },
                callback = function(event)
                    local lang = vim.treesitter.language.get_lang(event.match)
                    local is_installed = vim.treesitter.language.add(lang)

                    if not is_installed then
                        local ts = require("nvim-treesitter")
                        local available_langs = ts.get_available()

                        if vim.tbl_contains(available_langs, lang) then
                            vim.notify(
                                "Installing treesitter parser for " .. lang,
                                vim.log.levels.INFO
                            )
                            ts.install({ lang }):wait(30 * 1000)
                        end
                    end

                    local ok = pcall(vim.treesitter.start, event.buf, lang)
                    if not ok then
                        return
                    end

                    vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
                end,
            })
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
                typescriptreact = { "prettier" },
                json = { "prettier" },
                yaml = { "prettier" },
                python = { "black" },
                rust = { "rustfmt" },
                nix = { "nixpkgs_fmt" },
                go = { "gofmt" },
                haskell = { "ormolu" },
            },
            default_format_opts = {
                lsp_format = "never",
            },
            format_on_save = function()
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
