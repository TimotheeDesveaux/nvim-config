local ls = require("luasnip")

local s = ls.snippet
local i = ls.insert_node
local fmt = require("luasnip.extras.fmt").fmt

ls.add_snippets("markdown", {
    s("img", fmt("![{}]({})", { i(2), i(1) })),
})
