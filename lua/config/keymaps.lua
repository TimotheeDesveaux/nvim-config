vim.keymap.set("n", "<leader><leader>", ":e #<CR>", { desc = "previous file" })
vim.keymap.set("n", "<leader>j", "gT", { desc = "previous tab" })
vim.keymap.set("n", "<leader>k", "gt", { desc = "next tab" })

-- Move to window
vim.keymap.set("n", "<C-k>", "<c-w>k")
vim.keymap.set("n", "<C-l>", "<C-w>l")
vim.keymap.set("n", "<C-j>", "<C-w>j")
vim.keymap.set("n", "<C-h>", "<C-w>h")

-- Resize window
vim.keymap.set("n", "<C-Up>", ":resize +2<CR>")
vim.keymap.set("n", "<C-Down>", ":resize -2<CR>")
vim.keymap.set("n", "<C-Left>", ":vertical resize -2<CR>")
vim.keymap.set("n", "<C-Right>", ":vertical resize +2<CR>")

-- Move lines
vim.keymap.set("v", "<C-j>", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "<C-k>", ":m '<-2<CR>gv=gv")
