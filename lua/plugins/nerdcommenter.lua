local util = require('utils')

vim.g.NERDCreateDefaultMappings = 0
vim.g.NERDSpaceDelims = 1
vim.g.NERDDefaultAlign = 'left'

util.map('<leader>cc', '<plug>NERDCommenterComment', {})
util.map('<leader>cc', '<plug>NERDCommenterComment', {})
util.map('<leader>ci', '<plug>NERDCommenterInvert', {})
util.map('<leader>cu', '<plug>NERDCommenterUncomment', {})
util.map('<leader>cs', '<plug>NERDCommenterSexy', {})
util.map('<leader>cn', '<plug>NERDCommenterNested', {})
util.map('<leader>c$', '<plug>NERDCommenterToEOL', {})
util.map('<leader>cm', '<plug>NERDCommenterMinimal', {})
