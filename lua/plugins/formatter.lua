require('format').setup {
    ["*"] = {
        {cmd = {"sed -i 's/[ \t]*$//'"}} -- remove trailing whitespace
    },
    python = {
        {cmd = {"black"}}
    },
    c = {
        {cmd = {"clang-format -i"}}
    },
    cpp = {
        {cmd = {"clang-format -i"}}
    },
}

vim.cmd [[
augroup Format
    autocmd!
    autocmd BufWritePost * FormatWrite
augroup END
]]
