return {
    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        config = function()
            local wk = require("which-key")
            wk.setup()
            local keymaps = {
                {
                    mode = { "n" },
                    ["<leader>f"] = { name = "file/find" },
                    ["<leader>o"] = { name = "format" },
                    ["<leader>t"] = { name = "tree" },
                    ["<leader>d"] = { name = "debugger" },
                    ["gc"] = { name = "linewise comment" },
                    ["gb"] = { name = "blockwise comment" },
                },
                {
                    mode = { "v" },
                    ["gc"] = { desc = "linewise comment" },
                    ["gb"] = { desc = "blockwise comment" },
                },
            }
            wk.register(keymaps)
        end,
    },
    {
        "nvim-telescope/telescope.nvim",
        dependencies = {
            { "nvim-lua/plenary.nvim" },
            { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
            { "nvim-tree/nvim-web-devicons" },
        },
        cmd = "Telescope",
        keys = {
            { "<leader>ff", ":Telescope find_files<cr>", desc = "files" },
            { "<leader>fg", ":Telescope git_files<cr>", desc = "git files" },
            { "<leader>fr", ":Telescope live_grep<cr>", desc = "grep" },
            { "<leader>fb", ":Telescope buffers<cr>", desc = "buffers" },
            { "<leader>fm", ":Telescope marks<cr>", desc = "bookmarks" },
            { "<leader>fc", ":Telescope colorscheme<cr>", desc = "colorscheme" },
            { "<leader>fh", ":Telescope oldfiles<cr>", desc = "history" },
        },
        config = function()
            local telescope = require("telescope")
            telescope.setup()
            telescope.load_extension("fzf")
        end,
    },
    {
        "nvim-tree/nvim-tree.lua",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        opts = {
            actions = {
                open_file = { quit_on_open = true },
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
            git = { ignore = true },
            renderer = {
                highlight_git = true,
                icons = {
                    show = {
                        git = false,
                        folder = true,
                        file = true,
                        folder_arrow = true,
                    },
                },
            },
        },
        cmd = { "NvimTreeOpen", "NvimTreeToggle", "NvimTreeFocus", "NvimTreeFindFile" },
        keys = {
            { "<leader>tt", ":NvimTreeToggle<CR>", desc = "toggle" },
            { "<leader>tf", ":NvimTreeFocus<CR>", desc = "focus" },
            { "<leader>tr", ":NvimTreeRefresh<CR>", desc = "refresh" },
            { "<leader>to", ":NvimTreeFindFile<CR>", desc = "find opened file" },
        },
    },
    {
        "TimUntersberger/neogit",
        requires = { "nvim-lua/plenary.nvim" },
        cmd = "Neogit",
        keys = {
            { "<leader>g", ":Neogit<CR>", desc = "neogit" },
        },
    },
}
