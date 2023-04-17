local format_on_save = true

return {
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        dependencies = { "nvim-treesitter/playground" },
        event = { "BufReadPost", "BufNewFile" },
        opts = {
            ensure_installed = "all",
            highlight = { enable = true },
            playground = { enable = true, updatetime = 25 },
        },
        config = function(_, opts)
            require("nvim-treesitter.configs").setup(opts)
        end,
    },
    {
        "numToStr/Comment.nvim",
        keys = {
            { "gc", mode = { "n", "x" } },
            { "gb", mode = { "n", "x" } },
        },
        config = true,
    },
    {
        "mhartington/formatter.nvim",
        event = "BufWrite",
        keys = {
            {
                "<leader>ot",
                function()
                    format_on_save = not format_on_save
                end,
                desc = "toggle",
            },
            { "<leader>of", "<cmd>silent! Format<CR>", desc = "format" },
        },
        config = function()
            local formatter = require("formatter")

            formatter.setup({
                filetype = {
                    lua = { require("formatter.filetypes.lua").stylua },
                    c = { require("formatter.filetypes.c").clang_format },
                    cpp = { require("formatter.filetypes.cpp").clang_format },
                    javasctipt = {
                        require("formatter.filetypes.javascript").prettier,
                    },
                    typescript = {
                        require("formatter.filetypes.typescript").prettier,
                    },
                    json = { require("formatter.filetypes.json").prettier },
                    yaml = { require("formatter.filetypes.yaml").prettier },
                    python = { require("formatter.filetypes.python").black },
                    rust = { require("formatter.filetypes.rust").rustfmt },
                    nix = { require("formatter.filetypes.nix").nixpkgs_fmt },
                    go = { require("formatter.filetypes.go").gofmt },
                },
            })

            vim.api.nvim_create_autocmd("BufWritePost", {
                group = vim.api.nvim_create_augroup("my_format_write", { clear = true }),
                pattern = "*",
                callback = function()
                    if format_on_save then
                        vim.cmd("silent! FormatWrite")
                    end
                end,
            })
        end,
    },
}
