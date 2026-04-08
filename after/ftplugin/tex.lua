vim.opt_local.textwidth = 80
vim.keymap.set("n", "<leader>me", "<Cmd>TexlabBuild<CR>", { desc = "export to pdf", buffer = 0 })
vim.keymap.set(
    "n",
    "<leader>mv",
    "<Cmd>silent !zathura %:r.pdf &<CR>",
    { desc = "visualize", buffer = 0 }
)
