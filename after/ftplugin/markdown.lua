vim.opt_local.textwidth = 100
vim.keymap.set(
    "n",
    "<leader>me",
    "<Cmd>!pandoc % -o %:r.pdf<CR>",
    { desc = "export to pdf", buffer = 0 }
)
vim.keymap.set(
    "n",
    "<leader>mv",
    "<Cmd>silent !zathura %:r.pdf &<CR>",
    { desc = "visualize", buffer = 0 }
)
