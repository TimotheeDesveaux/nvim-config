return {
    "saghen/blink.cmp",
    dependencies = { "L3MON4D3/LuaSnip" },
    event = "InsertEnter",
    version = "*",
    opts = {
        snippets = {
            expand = function(snippet)
                require("luasnip").lsp_expand(snippet)
            end,
        },
        keymap = {
            preset = "enter",
            ["<C-Space>"] = { "show" },
            ["<Tab>"] = { "select_next", "fallback" },
            ["<S-Tab>"] = { "select_prev", "fallback" },
        },
        sources = { default = { "lsp", "path", "luasnip", "buffer" } },
        appearance = { use_nvim_cmp_as_default = false },
        signature = { enabled = true },
        completion = {
            list = { selection = "auto_insert" },
            accept = { auto_brackets = { enabled = true } },
            documentation = {
                auto_show = true,
                auto_show_delay_ms = 200,
            },
        },
    },
}
