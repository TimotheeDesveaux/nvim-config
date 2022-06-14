local ls = require("luasnip")

local s = ls.snippet
local i = ls.insert_node
local f = ls.function_node
local fmt = require("luasnip.extras.fmt").fmt
local rep = require("luasnip.extras").rep

ls.add_snippets("c", {
    s("inc", fmt('#include "{}"', { i(1) })),
    s("Inc", fmt("#include <{}>", { i(1) })),
    s(
        "main",
        fmt(
            [[
                int main(int argc, char* argv[])
                {{
                    {}
                    return 0;
                }}
            ]],
            { i(1) }
        )
    ),
    s(
        "mainv",
        fmt(
            [[
                int main(void)
                {{
                    {}
                    return 0;
                }}
            ]],
            { i(1) }
        )
    ),
    s(
        "for",
        fmt(
            [[
                for ({type} {var} = 0; {rep_var} < {count}; {rep_var}++)
                {{
                    {code}
                }}
            ]],
            {
                type = i(1, "size_t"),
                var = i(2, "i"),
                rep_var = rep(2),
                count = i(3, "count"),
                code = i(4),
            }
        )
    ),
    s(
        "while",
        fmt(
            [[
                while ({})
                {{
                    {}
                }}
            ]],
            { i(1), i(2) }
        )
    ),
    s(
        "if",
        fmt(
            [[
                if ({})
                {{
                    {}
                }}
            ]],
            { i(1), i(2) }
        )
    ),
    s(
        "else",
        fmt(
            [[
                else
                {{
                    {}
                }}
            ]],
            { i(1) }
        )
    ),
    s(
        "ife",
        fmt(
            [[
                if ({})
                {{
                    {}
                }}
                else
                {{
                    {}
                }}
            ]],
            { i(1), i(2), i(3) }
        )
    ),
    s("def", fmt("#define {}", { i(1, "KEY") })),
    s("defv", fmt("#define {} {}", { i(1, "KEY"), i(2, "value") })),
    s(
        "defh",
        fmt(
            [[
                #ifndef {file}
                #define {file}

                {code}

                #endif /* ! {file} */
            ]],
            {
                file = f(function()
                    return vim.fn.expand("%:t"):gsub("[.]", "_"):upper()
                end),
                code = i(1),
            }
        )
    ),
})
