require("nvim-treesitter.configs").setup({
    ensure_installed = "maintained",
    highlight = {
        enable = true,
    },
    autotag = {
        enable = true,
    },
    context_commentstring = {
        enable = true,
    },
})
