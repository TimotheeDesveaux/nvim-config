require("format").setup({
    ["*"] = {
        { cmd = { "sed -i 's/[ \t]*$//'" } }, -- remove trailing whitespace
    },
    python = {
        { cmd = { "black" } },
    },
    c = {
        { cmd = { "clang-format -i" } },
    },
    cpp = {
        { cmd = { "clang-format -i" } },
    },
    cmake = {
        { cmd = { "cmake-format -i" } },
    },
    lua = {
        { cmd = { "stylua" } },
    },
    javascript = {
        { cmd = { "prettier -w" } },
    },
    typescript = {
        { cmd = { "prettier -w" } },
    },
    json = {
        { cmd = { "prettier -w" } },
    },
    html = {
        { cmd = { "prettier -w" } },
    },
    css = {
        { cmd = { "prettier -w" } },
    },
    scss = {
        { cmd = { "prettier -w" } },
    },
    vue = {
        { cmd = { "prettier -w" } },
    },
    yaml = {
        { cmd = { "prettier -w" } },
    },
    rust = {
        { cmd = { "rustfmt" } },
    },
})

vim.cmd([[
augroup Format
    autocmd!
    autocmd BufWritePost * FormatWrite
augroup END
]])
