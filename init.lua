--             _
--  _ ____   _(_)_ __ ___  _ __ ___
-- | '_ \ \ / / | '_ ` _ \| '__/ __|
-- | | | \ V /| | | | | | | | | (__
-- |_| |_|\_/ |_|_| |_| |_|_|  \___|

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

-- Mappings --
vim.g.mapleader = " "
vim.api.nvim_set_keymap('n', 'Y', 'y$', { noremap = true })
vim.api.nvim_set_keymap('n', 'j', 'gj', { noremap = true })
vim.api.nvim_set_keymap('n', 'k', 'gk', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader><leader>', ':e #<CR>', { noremap = true })
vim.api.nvim_set_keymap('v', 'J', ':m \'>+1<CR>gv=gv', { noremap = true })
vim.api.nvim_set_keymap('v', 'K', ':m \'<-2<CR>gv=gv', { noremap = true })
vim.cmd(
[[
autocmd FileType markdown nnoremap <buffer> <leader>mp :silent !pandoc % -o %:r.pdf<CR>
autocmd FileType markdown nnoremap <buffer> <leader>mv :silent !zathura %:r.pdf &<CR>
]])

-- Miscellaneous --
vim.o.mouse = "a"
vim.o.clipboard = "unnamedplus"
vim.o.updatetime = 300
vim.o.timeoutlen = 300
vim.o.shortmess = vim.o.shortmess .. 'c'

-- Plugins --
require('plugins')

-- LSP --
require('lsp')
