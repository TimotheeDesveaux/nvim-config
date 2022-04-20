local util = require("utils")
local wk = require("which-key")

vim.g.mapleader = " "
util.vnoremap("J", ":m '>+1<CR>gv=gv")
util.vnoremap("K", ":m '<-2<CR>gv=gv")
util.nnoremap("<C-k>", "<C-w>k")
util.nnoremap("<C-l>", "<C-w>l")
util.nnoremap("<C-j>", "<C-w>j")
util.nnoremap("<C-h>", "<C-w>h")

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
