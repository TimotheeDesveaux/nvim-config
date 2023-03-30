return {
    {
        "folke/tokyonight.nvim",
        lazy = false,
        priority = 1000, -- load before everything else
        opts = { style = "storm" },
        config = function(_, opts)
            local tokyonight = require("tokyonight")
            tokyonight.setup(opts)
            tokyonight.load()
        end,
    },
    {
        "nvim-lualine/lualine.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        event = "VeryLazy",
        cond = not vim.g.started_by_firenvim,
        opts = {
            options = {
                theme = "tokyonight",
                section_separators = {
                    left = "",
                    right = "",
                },
                component_separators = {
                    left = "",
                    right = "",
                },
            },
        },
    },
    {
        "goolord/alpha-nvim",
        event = "VimEnter",
        config = function()
            local alpha = require("alpha")
            local dashboard = require("alpha.themes.dashboard")

            -- Set header
            dashboard.section.header.val = {
                "                                                     ",
                "  ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ",
                "  ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ",
                "  ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ",
                "  ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ",
                "  ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ",
                "  ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ",
                "                                                     ",
            }

            -- Set menu
            dashboard.section.buttons.val = {
                dashboard.button("e", "  > New file", ":ene<CR>"),
                dashboard.button("f", "  > Find file", ":Telescope find_files<CR>"),
                dashboard.button("r", "  > Find word", ":Telescope live_grep<CR>"),
                dashboard.button("t", "פּ  > File explorer", ":NvimTreeOpen<CR>"),
                dashboard.button("s", "  > Settings", ":e $MYVIMRC | :cd %:p:h<CR>"),
                dashboard.button("u", "  > Update plugins", ":Lazy update<CR>"),
                dashboard.button("g", "  > Neogit", ":Neogit<CR>"),
                dashboard.button("q", "  > Quit NVIM", ":qa<CR>"),
            }

            local function footer()
                local checker = require("lazy.manage.checker")
                local nb_updates = #checker.updated
                return nb_updates .. " update(s) pending"
            end

            dashboard.section.footer.val = footer()

            alpha.setup(dashboard.opts)
        end,
    },
    {
        "lukas-reineke/indent-blankline.nvim",
        event = { "BufReadPost", "BufNewFile" },
        opts = {
            buftype_exclude = { "terminal", "help" },
            filetype_exclude = { "alpha", "lazy" },
        },
    },
    {
        "stevearc/dressing.nvim",
        lazy = true,
        opts = {
            input = {
                win_options = { winblend = 0 },
            },
        },
        init = function()
            vim.ui.select = function(...)
                require("lazy").load({ plugins = { "dressing.nvim" } })
                return vim.ui.select(...)
            end
            vim.ui.input = function(...)
                require("lazy").load({ plugins = { "dressing.nvim" } })
                return vim.ui.input(...)
            end
        end,
    },
}
