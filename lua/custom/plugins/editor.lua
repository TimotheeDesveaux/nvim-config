return {
    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        opts = {
            spec = {
                {
                    mode = { "n" },
                    { "<leader>f", group = "file/find" },
                    { "<leader>o", group = "format" },
                    { "<leader>t", group = "tree" },
                    { "<leader>d", group = "debugger" },
                    { "<leader>l", group = "lsp" },
                    { "<leader>p", group = "pdf" },
                },
            },
            icons = { mappings = false },
        },
    },
    {
        "nvim-telescope/telescope.nvim",
        dependencies = {
            { "nvim-lua/plenary.nvim" },
            {
                "nvim-telescope/telescope-fzf-native.nvim",
                build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release",
            },
            { "nvim-tree/nvim-web-devicons" },
        },
        cmd = "Telescope",
        keys = function()
            local telescope = require("custom.utils").telescope

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
        "stevearc/oil.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        cmd = { "Oil" },
        keys = {
            { "<leader>tt", "<Cmd>Oil --float . getcwd()<CR>", desc = "root directory" },
            { "<leader>to", "<Cmd>Oil --float<CR>", desc = "parent directory" },
        },
        opts = {
            float = { padding = 5 },
            keymaps = {
                ["<C-v>"] = { "actions.select", opts = { vertical = true } },
                ["<C-x>"] = { "actions.select", opts = { horizontal = true } },
            },
        },
    },
    {
        "NeogitOrg/neogit",
        dependencies = { "nvim-lua/plenary.nvim" },
        cmd = "Neogit",
        keys = {
            { "<leader>g", "<Cmd>Neogit<CR>", desc = "neogit" },
        },
        opts = {
            disable_builtin_notifications = true,
        },
    },
}
