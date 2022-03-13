require("nvim-treesitter.configs").setup({
    ensure_installed = "maintained",
    highlight = {
        enable = true,
    },
    autotag = {
        enable = true,
    },
    playground = {
        enable = true,
        updatetime = 25,
    },
})
