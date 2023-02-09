local wk = require("which-key")

vim.keymap.set("n", "<C-k>", "<c-w>k")
vim.keymap.set("n", "<C-l>", "<C-w>l")
vim.keymap.set("n", "<C-j>", "<C-w>j")
vim.keymap.set("n", "<C-h>", "<C-w>h")

wk.register({
    ["<leader>"] = { ":e #<CR>", "previous file" },
    j = { "gT", "previous tab" },
    k = { "gt", "next tab" },
}, {
    prefix = "<leader>",
    noremap = true,
})

local function markdown_mappings()
    wk.register({
        name = "markdown",
        p = { "<cmd>silent !pandoc % -o %:r.pdf<CR>", "to pdf" },
        v = { "<cmd>silent !zathura %:r.pdf &<CR>", "visualize" },
    }, {
        prefix = "<leader>m",
        noremap = true,
        buffer = 0,
    })
end

vim.api.nvim_create_autocmd("FileType", {
    pattern = "markdown",
    callback = function()
        vim.schedule(markdown_mappings)
    end,
})
