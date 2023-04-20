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
                    mode = { "x" },
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
        keys = function()
            local function telescope(builtin)
                return function()
                    require("telescope.builtin")[builtin]()
                end
            end

            return {
                { "<leader>ff", telescope("find_files"), desc = "files" },
                { "<leader>fg", telescope("git_files"), desc = "git files" },
                { "<leader>fr", telescope("live_grep"), desc = "grep" },
                { "<leader>fb", telescope("buffers"), desc = "buffers" },
                { "<leader>fc", telescope("colorscheme"), desc = "colorscheme" },
                { "<leader>fh", telescope("oldfiles"), desc = "history" },
            }
        end,
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
            { "<leader>tt", "<Cmd>NvimTreeToggle<CR>", desc = "toggle" },
            { "<leader>tf", "<Cmd>NvimTreeFocus<CR>", desc = "focus" },
            { "<leader>tr", "<Cmd>NvimTreeRefresh<CR>", desc = "refresh" },
            { "<leader>to", "<Cmd>NvimTreeFindFile<CR>", desc = "find opened file" },
        },
    },
    {
        "TimUntersberger/neogit",
        requires = { "nvim-lua/plenary.nvim" },
        opts = {
            disable_builtin_notifications = true,
        },
        cmd = "Neogit",
        keys = {
            { "<leader>g", "<Cmd>Neogit<CR>", desc = "neogit" },
        },
    },
}
