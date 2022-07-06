local ls = require("luasnip")

local s = ls.snippet
local i = ls.insert_node
local fmt = require("luasnip.extras.fmt").fmt

ls.add_snippets("sh", {
    s(
        "if",
        fmt(
            [[
                if {}; then
                    {}
                fi
            ]],
            { i(1, "cond"), i(2) }
        )
    ),
    s(
        "elif",
        fmt(
            [[
                elif {}; then
                    {}
            ]],
            { i(1, "cond"), i(2) }
        )
    ),
    s(
        "else",
        fmt(
            [[
                else
                    {}
            ]],
            { i(1) }
        )
    ),
    s(
        "ife",
        fmt(
            [[
                if {}; then
                    {}
                else
                    {}
                fi
            ]],
            { i(1, "cond"), i(2), i(3) }
        )
    ),
    s(
        "for",
        fmt(
            [[
                for {} in {}; do
                    {}
                done
            ]],
            {
                i(1, "i"),
                i(2, "list"),
                i(3),
            }
        )
    ),
})
