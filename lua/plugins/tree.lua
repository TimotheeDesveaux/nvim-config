local wk = require("which-key")

vim.g.nvim_tree_gitignore = 1
vim.g.nvim_tree_quit_on_open = 1
vim.g.nvim_tree_git_hl = 1
vim.g.nvim_tree_show_icons = {
    git = 0,
    folders = 1,
    files = 1,
    folder_arrows = 1
}
vim.g.nvim_tree_icons = {
    lsp = {
        error = "",
        warning = "",
        hint = "",
        info = ""

    }
}

require("nvim-tree").setup {
    auto_close = true,
    lsp_diagnostics = true
}

wk.register({
    name = "tree",
    t = {":NvimTreeToggle<CR>", "toggle"},
    f = {":NvimTreeFocus<CR>", "focus"},
    r = {":NvimTreeRefresh<CR>", "refresh"},
    o = {":NvimTreeFindFile<CR>", "find opened file"}
}, {
    prefix = "<leader>t"
})
