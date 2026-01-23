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
        "ibhagwan/fzf-lua",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        keys = function()
            local fzf = require("custom.utils").fzf

            return {
                { "<leader>ff", fzf("files"), desc = "files" },
                { "<leader>fg", fzf("git_files"), desc = "git files" },
                { "<leader>fr", fzf("live_grep"), desc = "grep" },
                { "<leader>fb", fzf("buffers"), desc = "buffers" },
                { "<leader>fh", fzf("history"), desc = "history" },
            }
        end,
        opts = {},
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
                ["<C-s>"] = { "actions.select", opts = { horizontal = true } },
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
