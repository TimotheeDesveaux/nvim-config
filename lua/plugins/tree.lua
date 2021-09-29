local util = require("utils")

vim.g.nvim_tree_gitignore = 1
vim.g.nvim_tree_quit_on_open = 1
vim.g.nvim_tree_git_hl = 1
vim.g.nvim_tree_show_icons = {
    git = 0,
    folders = 1,
    files = 1,
    folder_arrows = 1
}

require("nvim-tree").setup {
    auto_close = true
}

util.nmap("<leader>tt", ":NvimTreeToggle<CR>")
