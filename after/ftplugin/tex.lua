vim.opt_local.textwidth = 80
vim.keymap.set("n", "<leader>pt", "<Cmd>TexlabBuild<CR>", { desc = "to pdf", buffer = 0 })
vim.keymap.set(
    "n",
    "<leader>pv",
    "<Cmd>silent !zathura %:r.pdf &<CR>",
    { desc = "visualize", buffer = 0 }
)
