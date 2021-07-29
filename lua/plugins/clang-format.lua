vim.api.nvim_set_var('clang_format#auto_format', 0)
vim.cmd('autocmd FileType c,cpp ClangFormatAutoEnable')
