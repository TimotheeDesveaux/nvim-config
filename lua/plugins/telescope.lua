local telescope = require("telescope")
local wk = require("which-key")

telescope.setup({})
telescope.load_extension("fzf")

wk.register({
    name = "fuzzy finder (telescope)",
    f = { "<cmd>Telescope find_files<cr>", "files" },
    g = { "<cmd>Telescope git_files<cr>", "git files" },
    r = { "<cmd>Telescope live_grep<cr>", "grep" },
    b = { "<cmd>Telescope buffers<cr>", "buffers" },
    m = { "<cmd>Telescope marks<cr>", "bookmarks" },
    c = { "<cmd>Telescope colorscheme<cr>", "colorscheme" },
    h = { "<cmd>Telescope oldfiles<cr>", "history" },
}, {
    prefix = "<leader>f",
    noremap = true,
})
