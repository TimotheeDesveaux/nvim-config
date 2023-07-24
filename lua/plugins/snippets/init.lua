return {
    "L3MON4D3/LuaSnip",
    keys = {
        {
            "<C-j>",
            function()
                if require("luasnip").jumpable(1) then
                    require("luasnip").jump(1)
                end
            end,
            mode = { "i", "s" },
        },
        {
            "<C-k>",
            function()
                if require("luasnip").jumpable(-1) then
                    require("luasnip").jump(-1)
                end
            end,
            mode = { "i", "s" },
        },
        {
            "<C-l>",
            function()
                if require("luasnip").choice_active() then
                    require("luasnip").change_choice(1)
                end
            end,
            mode = { "i", "s" },
        },
        {
            "<C-h>",
            function()
                if require("luasnip").choice_active() then
                    require("luasnip").change_choice(-1)
                end
            end,
            mode = { "i", "s" },
        },
    },
    opts = {
        history = true,
        update_events = { "TextChanged", "TextChangedI" },
    },
    config = function(_, opts)
        local ls = require("luasnip")
        ls.setup(opts)
        for _, lang in pairs({ "c", "make", "markdown", "tiger", "sh", "nix" }) do
            ls.add_snippets(lang, require("plugins.snippets." .. lang))
        end
        ls.add_snippets("cpp", require("plugins.snippets.c"))
    end,
}
