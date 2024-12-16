return {
    {
        "windwp/nvim-autopairs",
        event = "InsertEnter",
        config = true,
    },
    {
        "kylechui/nvim-surround",
        event = { "BufReadPost", "BufNewFile" },
        config = true,
    },
    {
        "jinh0/eyeliner.nvim",
        keys = {
            { "f", mode = { "n", "x", "o" } },
            { "F", mode = { "n", "x", "o" } },
            { "t", mode = { "n", "x", "o" } },
            { "T", mode = { "n", "x", "o" } },
        },
        opts = {
            highlight_on_key = true,
            dim = true,
        },
    },
}
