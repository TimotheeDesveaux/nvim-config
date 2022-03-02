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

vim.cmd([[
autocmd FileType markdown nnoremap <buffer> <leader>mp :silent !pandoc % -o %:r.pdf<CR>
autocmd FileType markdown nnoremap <buffer> <leader>ms :silent !marp --pdf --allow-local-files %<CR>
autocmd FileType markdown nnoremap <buffer> <leader>mv :silent !zathura %:r.pdf &<CR>
]])
