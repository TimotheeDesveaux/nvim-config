local gh = require("custom.utils").github

-- which-key
vim.pack.add({ gh("folke/which-key.nvim") })

require("which-key").setup({
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
})

-- fzf-lua
vim.pack.add({ gh("ibhagwan/fzf-lua") })

local fzf = require("fzf-lua")
fzf.setup("telescope")

vim.keymap.set("n", "<leader>ff", fzf.files, { desc = "files" })
vim.keymap.set("n", "<leader>fg", fzf.git_files, { desc = "git files" })
vim.keymap.set("n", "<leader>fr", fzf.live_grep, { desc = "grep" })
vim.keymap.set("n", "<leader>fb", fzf.buffers, { desc = "buffers" })
vim.keymap.set("n", "<leader>fh", fzf.history, { desc = "history" })

-- oil
vim.pack.add({ gh("stevearc/oil.nvim") })

require("oil").setup({
    float = { padding = 5 },
    keymaps = {
        ["<C-v>"] = { "actions.select", opts = { vertical = true } },
        ["<C-s>"] = { "actions.select", opts = { horizontal = true } },
    },
})

vim.keymap.set("n", "<leader>tt", "<Cmd>Oil --float . getcwd()<CR>", { desc = "root directory" })
vim.keymap.set("n", "<leader>to", "<Cmd>Oil --float<CR>", { desc = "parent directory" })

-- neogit
vim.pack.add({
    gh("nvim-lua/plenary.nvim"), -- dependency
    gh("NeogitOrg/neogit"),
})

require("neogit").setup({ disable_builtin_notifications = true })

vim.keymap.set("n", "<leader>g", "<Cmd>Neogit<CR>", { desc = "neogit" })
