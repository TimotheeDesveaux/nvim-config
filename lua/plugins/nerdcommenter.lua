vim.g.NERDCreateDefaultMappings = 0
vim.g.NERDSpaceDelims = 1
vim.g.NERDDefaultAlign = 'left'

vim.api.nvim_set_keymap('', '<leader>cc', '<plug>NERDCommenterComment', {})
vim.api.nvim_set_keymap('', '<leader>ci', '<plug>NERDCommenterInvert', {})
vim.api.nvim_set_keymap('', '<leader>cu', '<plug>NERDCommenterUncomment', {})
vim.api.nvim_set_keymap('', '<leader>cs', '<plug>NERDCommenterSexy', {})
vim.api.nvim_set_keymap('', '<leader>cn', '<plug>NERDCommenterNested', {})
vim.api.nvim_set_keymap('', '<leader>c$', '<plug>NERDCommenterToEOL', {})
vim.api.nvim_set_keymap('', '<leader>cm', '<plug>NERDCommenterMinimal', {})
