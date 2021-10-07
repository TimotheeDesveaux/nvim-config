require("format").setup {
    ["*"] = {
        {
            cmd = {"sed -i 's/[ \t]*$//'"} -- remove trailing whitespace
        }
    },
    python = {
        {
            cmd = {"black"}
        }
    },
    c = {
        {
            cmd = {"clang-format -i"}
        }
    },
    cpp = {
        {
            cmd = {"clang-format -i"}
        }
    },
    lua = {
        {
            cmd = {"lua-format --single-quote-to-double-quote -i"}
        }
    },
    javascript = {
        {
            cmd = {"prettier -w"}
        }
    },
    typescript = {
        {
            cmd = {"prettier -w"}
        }
    },
    html = {
        {
            cmd = {"prettier -w"}
        }
    },
    css = {
        {
            cmd = {"prettier -w"}
        }
    },
    vue = {
        {
            cmd = {"prettier -w"}
        }
    }
}

vim.cmd [[
augroup Format
    autocmd!
    autocmd BufWritePost * FormatWrite
augroup END
]]
