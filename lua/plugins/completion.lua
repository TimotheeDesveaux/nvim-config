local cmp = require("cmp")

cmp.setup({
    snippet = {
        expand = function(args)
            require("luasnip").lsp_expand(args.body)
        end,
    },
    mapping = cmp.mapping.preset.insert({
        ["<C-u>"] = cmp.mapping.scroll_docs(-4),
        ["<C-d>"] = cmp.mapping.scroll_docs(4),
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            else
                fallback()
            end
        end, { "i", "s" }),
        ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_prev_item()
            else
                fallback()
            end
        end, { "i", "s" }),
        ["<CR>"] = cmp.mapping.confirm({
            behavior = cmp.ConfirmBehavior.Replace,
            select = false,
        }),
    }),
    sources = cmp.config.sources({
        { name = "nvim_lua" },
    }, {
        { name = "nvim_lsp" },
        { name = "path" },
        { name = "luasnip" },
        { name = "calc" },
        { name = "nvim_lsp_signature_help" },
    }, {
        { name = "buffer" },
    }),
    formatting = {
        format = require("lspkind").cmp_format({
            with_text = true,
            menu = {
                nvim_lua = "[api]",
                nvim_lsp = "[LSP]",
                path = "[path]",
                luasnip = "[snip]",
                calc = "[calc]",
                nvim_lsp_signature_help = "[sign]",
                buffer = "[buf]",
            },
        }),
    },
})

cmp.setup.cmdline("/", {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
        { name = "buffer" },
    },
})

cmp.setup.cmdline(":", {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
        { name = "path" },
    }, {
        { name = "cmdline" },
    }),
})
