local utils = require("my.utils")

local augroup = utils.augroup
local gh = utils.github

-- treesitter
vim.pack.add({ gh("nvim-treesitter/nvim-treesitter") })

vim.api.nvim_create_autocmd("PackChanged", {
    group = augroup("packchanged"),
    callback = function(ev)
        local name, kind = ev.data.spec.name, ev.data.kind
        if name == "nvim-treesitter" and kind == "update" then
            if not ev.data.active then
                vim.cmd.packadd("nvim-treesitter")
            end
            vim.cmd("TSUpdate")
        end
    end,
})

vim.api.nvim_create_autocmd("FileType", {
    group = augroup("treesitter"),
    pattern = { "*" },
    callback = function(event)
        local lang = vim.treesitter.language.get_lang(event.match)
        if not lang then
            return
        end
        local is_installed = vim.treesitter.language.add(lang)

        if not is_installed then
            local ts = require("nvim-treesitter")
            local available_langs = ts.get_available()

            if vim.tbl_contains(available_langs, lang) then
                vim.notify("Installing treesitter parser for " .. lang, vim.log.levels.INFO)
                ts.install({ lang }):wait(30 * 1000)
            end
        end

        local ok = pcall(vim.treesitter.start, event.buf, lang)
        if not ok then
            return
        end
    end,
})

-- lazydev
vim.pack.add({ gh("folke/lazydev.nvim") })

require("lazydev").setup({
    library = {
        -- Load luvit types when the `vim.uv` word is found
        { path = "${3rd}/luv/library", words = { "vim%.uv" } },
    },
})

-- blink.cmp
vim.pack.add({ { src = gh("saghen/blink.cmp"), version = vim.version.range("1.x") } })

require("blink.cmp").setup({
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
})

-- conform
vim.pack.add({ gh("stevearc/conform.nvim") })

vim.g.autoformat = true

local conform = require("conform")
conform.setup({
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
        if utils.get_or_default(vim.b.autoformat, vim.g.autoformat) then
            return { timeout_ms = 500 }
        end
    end,
})

vim.keymap.set("n", "<leader>of", function()
    conform.format({ async = true })
end, { desc = "format buffer" })

vim.keymap.set("n", "<leader>ot", function()
    vim.g.autoformat = not vim.g.autoformat
    vim.notify(
        "Auto format " .. (vim.g.autoformat and "enabled" or "disabled"),
        vim.log.levels.INFO,
        { title = "Formatter" }
    )
end, { desc = "toggle" })
vim.keymap.set("n", "<leader>ob", function()
    vim.b.autoformat = not utils.get_or_default(vim.b.autoformat, vim.g.autoformat)
    vim.notify(
        "Buffer Auto format " .. (vim.b.autoformat and "enabled" or "disabled"),
        vim.log.levels.INFO,
        { title = "Formatter" }
    )
end, { desc = "buffer toggle" })
