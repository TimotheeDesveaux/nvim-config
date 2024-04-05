return {
    {
        "folke/tokyonight.nvim",
        lazy = false,
        priority = 1000, -- load before everything else
        opts = {
            style = "storm",
            on_highlights = function(hl, colors)
                hl.TabLine = { bg = colors.bg_statusline, fg = colors.fg_gutter }
                hl.TabLineSel = { bg = colors.bg_statusline, fg = colors.fg }
            end,
        },
        config = function(_, opts)
            local tokyonight = require("tokyonight")
            tokyonight.setup(opts)
            tokyonight.load()
        end,
    },
    {
        "nvim-lualine/lualine.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        cond = not vim.g.started_by_firenvim,
        event = "VeryLazy",
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
        "TimotheeDesveaux/luatab.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        event = "TabEnter",
        config = true,
    },
    {
        "rcarriga/nvim-notify",
        lazy = true,
        keys = {
            {
                "<leader>n",
                function()
                    require("notify").dismiss()
                end,
                desc = "dismiss notifications",
            },
        },
        init = function()
            vim.notify = function(...)
                return require("notify")(...)
            end
        end,
    },
    {
        "goolord/alpha-nvim",
        event = "VimEnter",
        config = function()
            local alpha = require("alpha")
            local dashboard = require("alpha.themes.dashboard")

            -- Set header
            dashboard.section.header.val = {
                " ███╗   ██╗███████╗ ██████╗ ██╗   ██╗   ██╗███╗   ███╗ ",
                " ████╗  ██║██╔════╝██╔═══██╗██║   ██║██╗██║████╗ ████║ ",
                " ██╔██╗ ██║█████╗  ██║   ██║██║   ██║╚═╝██║██╔████╔██║ ",
                " ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██╗██║██║╚██╔╝██║ ",
                " ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ╚═╝██║██║ ╚═╝ ██║ ",
                " ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝     ╚═╝╚═╝     ╚═╝ ",
            }

            -- Set menu
            dashboard.section.buttons.val = {
                dashboard.button("e", "  > New file", "<Cmd>ene<CR>"),
                dashboard.button("f", "󰱼  > Find file", "<Cmd>Telescope find_files<CR>"),
                dashboard.button("r", "󰈬  > Find word", "<Cmd>Telescope live_grep<CR>"),
                dashboard.button("t", "󰙅  > File explorer", "<Cmd>NvimTreeOpen<CR>"),
                dashboard.button("s", "  > Settings", "<Cmd>e $MYVIMRC | cd %:p:h<CR>"),
                dashboard.button("u", "  > Update plugins", "<Cmd>Lazy update<CR>"),
                dashboard.button("g", "  > Neogit", "<Cmd>Neogit<CR>"),
                dashboard.button("q", "  > Quit NVIM", "<Cmd>qa<CR>"),
            }

            local function footer()
                local config = require("lazy.core.config")
                local plugins = vim.tbl_values(config.plugins)
                return #plugins .. " plugins total"
            end
            dashboard.section.footer.val = footer()

            alpha.setup(dashboard.opts)
        end,
    },
    {
        "lukas-reineke/indent-blankline.nvim",
        event = { "BufReadPost", "BufNewFile" },
        main = "ibl",
        opts = {
            scope = {
                enabled = true,
                show_start = false,
                show_end = false,
            },
            exclude = {
                filetypes = { "alpha", "lazy", "NvimTree" },
            },
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
