vim.keymap.set("n", "<C-k>", "<c-w>k")
vim.keymap.set("n", "<C-l>", "<C-w>l")
vim.keymap.set("n", "<C-j>", "<C-w>j")
vim.keymap.set("n", "<C-h>", "<C-w>h")

vim.keymap.set("n", "<leader><leader>", ":e #<CR>", { desc = "previous file" })
vim.keymap.set("n", "<leader>j", "gT", { desc = "previous tab" })
vim.keymap.set("n", "<leader>k", "gt", { desc = "next tab" })
