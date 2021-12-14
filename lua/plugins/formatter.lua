local formatter = require("formatter")

local function prettier()
    return {
        exe = "prettier",
        args = {
            "--stdin-filepath",
            vim.fn.fnameescape(vim.api.nvim_buf_get_name(0)),
        },
        stdin = true,
    }
end

local function clangformat()
    return {
        exe = "clang-format",
        args = { "--assume-filename", vim.api.nvim_buf_get_name(0) },
        stdin = true,
        cwd = vim.fn.expand("%:p:h"),
    }
end

formatter.setup({
    filetype = {
        c = { clangformat },
        cpp = { clangformat },
        javascript = { prettier },
        typescript = { prettier },
        json = { prettier },
        html = { prettier },
        css = { prettier },
        scss = { prettier },
        vue = { prettier },
        yaml = { prettier },
        python = {
            function()
                return {
                    exe = "black",
                    args = { "-" },
                    stdin = true,
                }
            end,
        },
        lua = {
            function()
                return {
                    exe = "stylua",
                    args = { "-" },
                    stdin = true,
                }
            end,
        },
        rust = {
            function()
                print("hello world")
                return {
                    exe = "rustfmt",
                    args = { "--emit=stdout" },
                    stdin = true,
                }
            end,
        },
    },
})
vim.cmd([[
augroup FormatAutogroup
  autocmd!
  autocmd BufWritePost * silent! FormatWrite
augroup END
]])
