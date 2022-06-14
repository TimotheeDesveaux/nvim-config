local ls = require("luasnip")
local util = require("utils")

require("plugins.snippets.c")

ls.config.set_config({
    history = true,
    updateevents = "TextChanged,TextChangedI",
})

util.smap("<C-j>", "<cmd>lua require('luasnip').jump(1)<CR>", { silent = true })
util.imap("<C-j>", "<cmd>lua require('luasnip').jump(1)<CR>", { silent = true })

util.smap(
    "<C-k>",
    "<cmd>lua require('luasnip').jump(-1)<CR>",
    { silent = true }
)
util.imap(
    "<C-k>",
    "<cmd>lua require('luasnip').jump(-1)<CR>",
    { silent = true }
)
