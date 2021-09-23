local util = require("utils")
local luasnip = require("luasnip")

luasnip.config.set_config {
    history = true,
    updateevents = "TextChanged,TextChangedI"
}

require("luasnip/loaders/from_vscode").load()

util.smap("<C-l>", "<cmd>lua require('luasnip').jump(1)<CR>", {
    silent = true
})
util.imap("<C-l>", "<cmd>lua require('luasnip').jump(1)<CR>", {
    silent = true
})

util.smap("<C-h>", "<cmd>lua require('luasnip').jump(-1)<CR>", {
    silent = true
})
util.imap("<C-h>", "<cmd>lua require('luasnip').jump(-1)<CR>", {
    silent = true
})
