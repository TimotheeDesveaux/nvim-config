local ls = require("luasnip")

local s = ls.snippet
local i = ls.insert_node
local fmt = require("luasnip.extras.fmt").fmt
local rep = require("luasnip.extras").rep

ls.add_snippets("make", {
    s(
        "cproj",
        fmt(
            [[
                CC?=gcc
                CPPFLAGS={cppflags}
                CFLAGS={cflags}
                LDFLAGS={ldflags}

                SRC=$(addprefix src/, {src}.c)
                OBJS=$(SRC:.c=.o)
                BIN={bin}

                all: $(BIN)

                $(BIN): $(OBJS)
                	$(CC) $(LDFLAGS) -o $@ $^

                debug: CPPFLAGS+={debug_cppflags}
                debug: CFLAGS+={debug_cflags}
                debug: LDFLAGS+={debug_ldflags}
                debug: $(BIN)

                clean:
                	$(RM) $(BIN) $(OBJS)

                .PHONY: clean
            ]],
            {
                cppflags = i(1),
                cflags = i(2, "-Wall -Wextra -Wvla -Werror -pedantic -std=c99"),
                ldflags = i(3),
                src = rep(4),
                bin = i(4),
                debug_cppflags = i(5),
                debug_cflags = i(6, "-fsanitize=address -g"),
                debug_ldflags = i(7, "-fsanitize=address"),
            }
        )
    ),
})
