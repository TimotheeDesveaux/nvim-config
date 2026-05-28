local gh = require("my.utils").github

-- devicons (dependency for other plugins)
vim.pack.add({ gh("nvim-tree/nvim-web-devicons") })

-- tokyonight
vim.pack.add({ gh("folke/tokyonight.nvim") })

local tokyonight = require("tokyonight")
tokyonight.setup({
    style = "storm",
    on_highlights = function(hl, colors)
        hl.TabLine = { bg = colors.bg_statusline, fg = colors.fg_gutter }
        hl.TabLineSel = { bg = colors.bg_statusline, fg = colors.fg }
    end,
})
tokyonight.load()

-- lualine
vim.pack.add({ gh("nvim-lualine/lualine.nvim") })

require("lualine").setup({
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
    sections = {
        lualine_c = {
            { "filename", path = 1 },
        },
    },
})

-- luatab
vim.pack.add({ gh("alvarosevilla95/luatab.nvim") })

require("luatab").setup()

-- notify
vim.pack.add({ gh("rcarriga/nvim-notify") })

local notify = require("notify")
vim.notify = notify

vim.keymap.set("n", "<leader>n", notify.dismiss, { desc = "dismiss notifications " })

-- alpha
vim.pack.add({ gh("goolord/alpha-nvim") })

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
    dashboard.button("f", "󰱼  > Find file", "<Cmd>lua require('fzf-lua').files()<CR>"),
    dashboard.button("r", "󰈬  > Find word", "<Cmd>lua require('fzf-lua').live_grep()<CR>"),
    dashboard.button("t", "󰙅  > File explorer", "<Cmd>Oil<CR>"),
    dashboard.button("s", "  > Settings", "<Cmd>e $MYVIMRC | cd %:p:h<CR>"),
    dashboard.button("u", "  > Update plugins", "<Cmd>lua vim.pack.update()<CR>"),
    dashboard.button("g", "  > Neogit", "<Cmd>Neogit<CR>"),
    dashboard.button("q", "  > Quit NVIM", "<Cmd>qa<CR>"),
}

local function footer()
    local plugins = vim.pack.get()
    return #plugins .. " plugins total"
end
dashboard.section.footer.val = footer()

alpha.setup(dashboard.opts)

-- indent-blankline
vim.pack.add({ gh("lukas-reineke/indent-blankline.nvim") })

require("ibl").setup({
    scope = {
        enabled = true,
        show_start = false,
        show_end = false,
    },
    exclude = {
        filetypes = { "alpha", "NvimTree" },
    },
})

-- nvim-highlight-colors
vim.pack.add({ gh("brenoprata10/nvim-highlight-colors") })

require("nvim-highlight-colors").setup({})
