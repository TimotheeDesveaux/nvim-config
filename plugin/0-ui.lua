local gh = require("custom.utils").github

vim.pack.add({
    gh("nvim-tree/nvim-web-devicons"),
    gh("folke/tokyonight.nvim"),
    gh("nvim-lualine/lualine.nvim"),
    gh("alvarosevilla95/luatab.nvim"),
    gh("rcarriga/nvim-notify"),
    gh("goolord/alpha-nvim"),
    gh("lukas-reineke/indent-blankline.nvim"),
})

-- tokyonight
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
require("luatab").setup()

-- notify
local notify = require("notify")
vim.notify = notify

vim.keymap.set("n", "<leader>n", notify.dismiss, { desc = "dismiss notifications " })

-- alpha
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
