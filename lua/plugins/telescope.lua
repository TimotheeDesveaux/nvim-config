local util = require('utils')

util.nnoremap('<leader>ff', '<cmd>Telescope find_files<cr>')
util.nnoremap('<leader>fg', '<cmd>Telescope git_files<cr>')
util.nnoremap('<leader>fr', '<cmd>Telescope live_grep<cr>')
util.nnoremap('<leader>fb', '<cmd>Telescope buffers<cr>')
util.nnoremap('<leader>fm', '<cmd>Telescope marks<cr>')
util.nnoremap('<leader>fc', '<cmd>Telescope colorscheme<cr>')
util.nnoremap('<leader>fh', '<cmd>Telescope oldfiles<cr>')
