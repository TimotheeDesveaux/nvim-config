local formatter = require("formatter")

local function prettier()
    return {
        exe = "prettier",
        args = {
            "--stdin-filepath",
            vim.fn.shellescape(vim.api.nvim_buf_get_name(0)),
        },
        stdin = true,
    }
end

local function clang_format()
    return {
        exe = "clang-format",
        args = {
            "--assume-filename",
            vim.fn.shellescape(vim.api.nvim_buf_get_name(0)),
        },
        stdin = true,
        cwd = vim.fn.expand("%:p:h"),
    }
end

formatter.setup({
    filetype = {
        c = { clang_format },
        cpp = { clang_format },
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
                return {
                    exe = "rustfmt",
                    args = { "--emit=stdout" },
                    stdin = true,
                }
            end,
        },
        nix = {
            function()
                return {
                    exe = "nixfmt",
                    args = {},
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
