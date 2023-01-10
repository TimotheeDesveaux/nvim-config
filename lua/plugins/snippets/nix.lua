local ls = require("luasnip")

local s = ls.snippet
local i = ls.insert_node
local fmt = require("luasnip.extras.fmt").fmt

ls.add_snippets("nix", {
    s(
        "shell",
        fmt(
            [[
                {{ pkgs ? import <nixos> {{ }} }}:
                pkgs.mkShell {{
                  name = "{}-env";
                  nativeBuildInputs = with pkgs; [
                    {}
                  ];
                }}
            ]],
            {
                i(1),
                i(2),
            }
        )
    ),
})
