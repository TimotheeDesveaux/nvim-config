local ls = require("luasnip")

local s = ls.snippet
local i = ls.insert_node
local fmt = require("luasnip.extras.fmt").fmt

return {
    s("img", fmt("![{}]({})", { i(2), i(1) })),
    s("lnk", fmt("[{}]({})", { i(2), i(1) })),
}
