return {
    {
        "windwp/nvim-autopairs",
        event = "InsertEnter",
        config = function()
            require("nvim-autopairs").setup()

            local cmp_autopairs = require("nvim-autopairs.completion.cmp")
            local cmp = require("cmp")
            cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done({ map_char = { tex = "" } }))
        end,
    },
    {
        "kylechui/nvim-surround",
        event = { "BufReadPost", "BufNewFile" },
        config = true,
    },
    {
        "jinh0/eyeliner.nvim",
        opts = {
            highlight_on_key = true,
            dim = true,
        },
        keys = { "f", "t" },
    },
}
