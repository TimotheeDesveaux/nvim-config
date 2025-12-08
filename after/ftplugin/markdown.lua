vim.opt_local.textwidth = 100
vim.keymap.set("n", "<leader>pt", "<Cmd>!pandoc % -o %:r.pdf<CR>", { desc = "to pdf", buffer = 0 })
vim.keymap.set(
    "n",
    "<leader>pv",
    "<Cmd>silent !zathura %:r.pdf &<CR>",
    { desc = "visualize", buffer = 0 }
)
