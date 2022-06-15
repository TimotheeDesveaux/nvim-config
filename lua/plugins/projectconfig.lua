local dashboard = require("alpha.themes.dashboard")

local function tiger_config()
    vim.opt.shiftwidth = 2
    dashboard.section.header.val = {
        [[    _         ___         _    ]],
        [[  /`.`.  .-=""_;_""=-.  .','\  ]],
        [[ |  \`.`#"'.-" ; "-.`"#'.',  | ]],
        [[  \`=>-Y ,(  O_;_O  ) ,Y=<-'/  ]],
        [[   `--'\#>-`-'_;_`-'-<#/`--'   ]],
        [[     _  /   .::;::. _ \  _     ]],
        [[  .-' `-i-_ |:::::|  `i-' `-._ ]],
        [[ '    .-j'  `:::::' `-j-.      ]],
        [[    .'  `L'   "T"   `j-. `.    ]],
        [[         |\.___:___./|  `      ]],
        [[         | `._____.' |         ]],
        [[         \           /         ]],
        [[          `.       .'          ]],
        [[            `.___.'            ]],
    }
end

require("nvim-projectconfig").setup({
    project_config = {
        { path = "tc", config = tiger_config },
        { path = "tc-2024", config = tiger_config },
    },
})
