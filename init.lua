--             _
--  _ ____   _(_)_ __ ___  _ __ ___
-- | '_ \ \ / / | '_ ` _ \| '__/ __|
-- | | | \ V /| | | | | | | | | (__
-- |_| |_|\_/ |_|_| |_| |_|_|  \___|

local util = require('utils')

-- Indentation --
vim.o.tabstop = 8
vim.o.shiftwidth = 4
vim.o.expandtab = true
vim.cmd('autocmd Filetype make setlocal noexpandtab shiftwidth=8')

-- Search --
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.hlsearch = false

-- File --
vim.o.autowrite = true
vim.o.backup = false
vim.o.swapfile = false
vim.o.hidden = true
vim.cmd('autocmd BufEnter *.ll set filetype=lex')

-- Interface --
vim.o.termguicolors = true
vim.o.number = true
vim.o.colorcolumn = "80"
vim.o.showmode = false
vim.o.cursorline = true
vim.o.scrolloff = 10
vim.o.list = true
vim.o.listchars = "tab:»·,trail:¤"
vim.o.splitbelow = true
vim.o.splitright = true
vim.o.signcolumn = "yes"
vim.o.pumheight = 20
vim.o.completeopt = "menuone,noselect"

-- Miscellaneous --
vim.o.mouse = "a"
vim.o.clipboard = "unnamedplus"
vim.o.updatetime = 300
vim.o.timeoutlen = 300
vim.o.shortmess = vim.o.shortmess .. 'c'

-- Mappings --
vim.g.mapleader = " "
util.nnoremap('Y', 'y$')
util.nnoremap('j', 'gj')
util.nnoremap('k', 'gk')
util.nnoremap('<leader><leader>', ':e #<CR>')
util.vnoremap('J', ':m \'>+1<CR>gv=gv')
util.vnoremap('K', ':m \'<-2<CR>gv=gv')
vim.cmd(
[[
autocmd FileType markdown nnoremap <buffer> <leader>mp :silent !pandoc % -o %:r.pdf<CR>
autocmd FileType markdown nnoremap <buffer> <leader>mv :silent !zathura %:r.pdf &<CR>
]])

-- Plugins --
require('plugins')

-- LSP --
require('lsp')
