require("nvim-treesitter.configs").setup({
    ensure_installed = "all",
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
