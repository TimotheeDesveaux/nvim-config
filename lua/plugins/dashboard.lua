vim.g.dashboard_default_executive = 'telescope'
vim.g.dashboard_custom_shortcut = {
    book_marks         = 'SPC f m',
    change_colorscheme = 'SPC f c',
    find_file          = 'SPC f f',
    find_history       = 'SPC f h',
    find_word          = 'SPC f r',
    last_session       = 'SPC s l',
    new_file           = 'SPC c n',
}

vim.g.dashboard_custom_header = {
    ' ███╗   ██╗ ███████╗ ██████╗  ██╗   ██╗ ██╗ ███╗   ███╗',
    ' ████╗  ██║ ██╔════╝██╔═══██╗ ██║   ██║ ██║ ████╗ ████║',
    ' ██╔██╗ ██║ █████╗  ██║   ██║ ██║   ██║ ██║ ██╔████╔██║',
    ' ██║╚██╗██║ ██╔══╝  ██║   ██║ ╚██╗ ██╔╝ ██║ ██║╚██╔╝██║',
    ' ██║ ╚████║ ███████╗╚██████╔╝  ╚████╔╝  ██║ ██║ ╚═╝ ██║',
    ' ╚═╝  ╚═══╝ ╚══════╝ ╚═════╝    ╚═══╝   ╚═╝ ╚═╝     ╚═╝',
}

local util = require('utils')
util.nnoremap('<leader>ss' ,':<C-u>SessionSave<CR>')
util.nnoremap('<leader>sl' ,':<C-u>SessionLoad<CR>')
