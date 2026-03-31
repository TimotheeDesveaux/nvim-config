-- Indentation --
vim.opt.tabstop = 8
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

-- Search and Replace --
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = false
vim.opt.inccommand = "split"

-- File --
vim.opt.autowrite = true
vim.opt.backup = false
vim.opt.swapfile = false
vim.opt.undofile = true
vim.opt.hidden = true

-- Interface --
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.colorcolumn = "100"
vim.opt.showmode = false
vim.opt.laststatus = 3
vim.opt.cursorline = true
vim.opt.scrolloff = 10
vim.opt.sidescrolloff = 10
vim.opt.list = true
vim.opt.listchars = { tab = "»-", trail = "·" }
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.signcolumn = "yes"
vim.opt.pumheight = 20
vim.opt.completeopt = { "menu", "menuone", "noselect" }
vim.opt.wrap = false

-- Miscellaneous --
vim.opt.mouse = "a"
vim.opt.clipboard = "unnamedplus"
vim.opt.updatetime = 300
vim.opt.timeoutlen = 300
vim.opt.tildeop = true
