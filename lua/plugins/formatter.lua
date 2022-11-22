local wk = require("which-key")
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
        arduino = { clang_format },
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
                    args = { "--search-parent-directories", "-" },
                    stdin = true,
                }
            end,
        },
        rust = {
            function()
                return {
                    exe = "rustfmt",
                    args = { "--emit=stdout", "--edition=2021" },
                    stdin = true,
                }
            end,
        },
        nix = {
            function()
                return {
                    exe = "nixpkgs-fmt",
                    args = {},
                    stdin = true,
                }
            end,
        },
        go = {
            function()
                return {
                    exe = "gofmt",
                    args = {},
                    stdin = true,
                }
            end,
        },
    },
})

local format_on_save = true

vim.api.nvim_create_autocmd("BufWritePost", {
    pattern = "*",
    callback = function()
        if format_on_save then
            vim.cmd("silent! FormatWrite")
        end
    end,
})

wk.register({
    name = "formatter",
    t = {
        function()
            format_on_save = not format_on_save
        end,
        "toggle",
    },
    f = {
        "<cmd>silent! FormatWrite<CR>",
        "format",
    },
}, {
    prefix = "<leader>o",
    noremap = true,
})
