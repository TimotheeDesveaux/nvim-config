return {
    "L3MON4D3/LuaSnip",
    opts = {
        history = true,
        update_events = { "TextChanged", "TextChangedI" },
    },
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
    config = function(_, opts)
        require("luasnip").setup(opts)

        require("plugins.snippets.c")
        require("plugins.snippets.make")
        require("plugins.snippets.markdown")
        require("plugins.snippets.tiger")
        require("plugins.snippets.shell")
        require("plugins.snippets.nix")
    end,
}
