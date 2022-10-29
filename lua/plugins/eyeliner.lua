vim.api.nvim_set_hl(0, "EyelinerPrimary", { bold = true, underline = true })
vim.api.nvim_set_hl(0, "EyelinerSecondary", { underline = true })

require("eyeliner").setup({
    highlight_on_key = true,
})
