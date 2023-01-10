local ls = require("luasnip")

require("plugins.snippets.c")
require("plugins.snippets.make")
require("plugins.snippets.markdown")
require("plugins.snippets.tiger")
require("plugins.snippets.shell")
require("plugins.snippets.nix")

ls.config.set_config({
    history = true,
    updateevents = "TextChanged,TextChangedI",
})

vim.keymap.set({ "i", "s" }, "<C-j>", function()
    if ls.jumpable(1) then
        ls.jump(1)
    end
end)
vim.keymap.set({ "i", "s" }, "<C-k>", function()
    if ls.jumpable(-1) then
        ls.jump(-1)
    end
end)

vim.keymap.set({ "i", "s" }, "<C-l>", function()
    if ls.choice_active() then
        ls.change_choice(1)
    end
end)
vim.keymap.set({ "i", "s" }, "<C-h>", function()
    if ls.choice_active() then
        ls.change_choice(-1)
    end
end)
