local util = require("utils")

vim.g.mapleader = " "
util.nnoremap("Y", "y$")
util.nnoremap("<leader><leader>", ":e #<CR>")
util.vnoremap("J", ":m '>+1<CR>gv=gv")
util.vnoremap("K", ":m '<-2<CR>gv=gv")
vim.cmd [[
autocmd FileType markdown nnoremap <buffer> <leader>mp :silent !pandoc % -o %:r.pdf<CR>
autocmd FileType markdown nnoremap <buffer> <leader>mv :silent !zathura %:r.pdf &<CR>
]]

