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
    dashboard.button("e", "  > New file", ":ene | startinsert <CR>"),
    dashboard.button("f", "  > Find file", ":Telescope find_files<CR>"),
    dashboard.button("r", "  > Find word", ":Telescope live_grep<CR>"),
    dashboard.button("t", "פּ  > File explorer", ":NvimTreeOpen<CR>"),
    dashboard.button(
        "s",
        "  > Settings",
        ":e $MYVIMRC | :cd %:p:h | pwd<CR>"
    ),
    dashboard.button("u", "  > Update plugins", ":PackerUpdate<CR>"),
    dashboard.button("q", "  > Quit NVIM", ":qa<CR>"),
}

local function footer()
    local total_plugins = #vim.tbl_keys(packer_plugins)
    local datetime = os.date("%d-%m-%Y  %H:%M:%S")
    return "┌─ "
        .. datetime
        .. " ─┐\n└─  "
        .. total_plugins
        .. " plugins in total ─┘"
end

dashboard.section.footer.val = footer()

-- Send config to alpha
alpha.setup(dashboard.opts)
