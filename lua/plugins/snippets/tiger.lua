local ls = require("luasnip")

local s = ls.snippet
local sn = ls.snippet_node
local t = ls.text_node
local i = ls.insert_node
local c = ls.choice_node
local fmt = require("luasnip.extras.fmt").fmt

ls.add_snippets("tiger", {
    s(
        "let",
        fmt(
            [[
                let
                    {}
                in
                    {}
                end
            ]],
            { i(1), i(2) }
        )
    ),
    s(
        "var",
        fmt("var {}{} := {}", {
            i(1, "a"),
            c(2, {
                sn(nil, { t(" : "), i(1, "int") }),
                t(""),
            }),
            i(3, "42"),
        })
    ),
    s(
        "fun",
        fmt(
            [[
                function {name}({args}){type} =
                    {body}
            ]],
            {
                name = i(1, "foo"),
                args = i(2),
                type = c(3, {
                    sn(nil, { t(" : "), i(1, "int") }),
                    t(""),
                }),
                body = i(4, "()"),
            }
        )
    ),
    s(
        "type",
        fmt("type {} = {}", {
            i(1, "t"),
            i(2, "int"),
        })
    ),
})
