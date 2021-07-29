local function nmap(...)
    vim.api.nvim_set_keymap("n", ...)
end

nmap('<leader>ff', '<cmd>Telescope find_files<cr>', { noremap = true})
nmap('<leader>fg', '<cmd>Telescope git_files<cr>', { noremap = true})
nmap('<leader>fr', '<cmd>Telescope live_grep<cr>', { noremap = true})
nmap('<leader>fb', '<cmd>Telescope buffers<cr>', { noremap = true})
nmap('<leader>fm', '<cmd>Telescope marks<cr>', { noremap = true})
nmap('<leader>fc', '<cmd>Telescope colorscheme<cr>', { noremap = true})
nmap('<leader>fh', '<cmd>Telescope oldfiles<cr>', { noremap = true})
