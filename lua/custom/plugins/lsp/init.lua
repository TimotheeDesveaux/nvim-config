return {
    "neovim/nvim-lspconfig",
    dependencies = {
        { "saghen/blink.cmp" },
        {
            "kosayoda/nvim-lightbulb",
            opts = {
                sign = { enabled = false },
                virtual_text = {
                    enabled = true,
                    text = "󰌵",
                },
                autocmd = { enabled = true },
            },
        },
        {
            "j-hui/fidget.nvim",
            config = true,
        },
    },
    event = { "BufReadPre", "BufNewFile" },
    config = function()
        require("custom.plugins.lsp.ui").setup()

        vim.diagnostic.config({
            severity_sort = true,
            virtual_text = true,
        })

        vim.api.nvim_create_autocmd("LspAttach", {
            group = vim.api.nvim_create_augroup("custom_lsp", {}),
            callback = function(args)
                local client = assert(vim.lsp.get_client_by_id(args.data.client_id))
                require("custom.plugins.lsp.keymaps").on_attach(args.buf)
                require("custom.plugins.lsp.ui").on_attach(client, args.buf)
            end,
        })

        local servers = {
            lua_ls = {
                settings = {
                    Lua = {
                        runtime = { version = "LuaJIT" },
                        workspace = { checkThirdParty = false },
                        telemetry = { enable = false },
                    },
                },
            },
            clangd = {
                capabilities = {
                    textDocument = { completion = { completionItem = { snippetSupport = false } } },
                },
            },
            pyright = {},
            texlab = {},
            nil_ls = {},
            rust_analyzer = {},
            hls = {},
            vtsls = {},
            tailwindcss = {},
        }

        for server, config in pairs(servers) do
            vim.lsp.config(server, config)
            vim.lsp.enable(server)
        end
    end,
}
