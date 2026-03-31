local gh = require("my.utils").github

-- LuaSnip
vim.pack.add({ gh("L3MON4D3/LuaSnip") })

local ls = require("luasnip")
ls.setup({
    update_events = { "TextChanged", "TextChangedI" },
})

vim.keymap.set({ "i", "s" }, "<C-j>", function()
    ls.jump(1)
end, { silent = true })
vim.keymap.set({ "i", "s" }, "<C-k>", function()
    ls.jump(-1)
end, { silent = true })

vim.keymap.set({ "i", "s" }, "<C-l>", function()
    if ls.choice_active() then
        ls.change_choice(1)
    end
end, { silent = true })
vim.keymap.set({ "i", "s" }, "<C-h>", function()
    if ls.choice_active() then
        ls.change_choice(-1)
    end
end, { silent = true })

for _, lang in pairs({ "c", "make", "markdown", "sh", "nix", "rust" }) do
    ls.add_snippets(lang, require("my.snippets." .. lang))
end
ls.add_snippets("cpp", require("my.snippets.c"))
