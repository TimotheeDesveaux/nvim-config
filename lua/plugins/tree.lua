local wk = require("which-key")

require("nvim-tree").setup({
    actions = {
        open_file = {
            quit_on_open = true,
        },
    },
    diagnostics = {
        enable = false,
        icons = {
            error = "",
            warning = "",
            hint = "",
            info = "",
        },
    },
    git = {
        ignore = true,
    },
    open_file = {
        quit_on_open = true,
    },
    renderer = {
        highlight_git = true,
        icons = {
            show = {
                git = false,
                folders = true,
                files = true,
                folder_arrows = true,
            },
        },
    },
})

wk.register({
    name = "tree",
    t = { ":NvimTreeToggle<CR>", "toggle" },
    f = { ":NvimTreeFocus<CR>", "focus" },
    r = { ":NvimTreeRefresh<CR>", "refresh" },
    o = { ":NvimTreeFindFile<CR>", "find opened file" },
}, {
    prefix = "<leader>t",
})
