return {
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            { "hrsh7th/cmp-nvim-lsp" },
            {
                "kosayoda/nvim-lightbulb",
                opts = {
                    sign = { enabled = false },
                    virtual_text = {
                        enabled = true,
                        text = "",
                    },
                    autocmd = { enabled = true },
                },
            },
            { "SmiteshP/nvim-navic" },
            {
                "j-hui/fidget.nvim",
                opts = {
                    text = {
                        spinner = "dots",
                        done = "",
                    },
                },
            },
        },
        event = { "BufReadPre", "BufNewFile" },
        config = function()
            require("plugins.lsp.ui").setup()

            local function on_attach(client, bufnr)
                require("plugins.lsp.keymaps").attach(bufnr)

                if client.server_capabilities.documentSymbolProvider then
                    require("nvim-navic").attach(client, bufnr)
                    vim.opt_local.winbar = "%{%v:lua.require('nvim-navic').get_location()%}"
                end

                -- Highlight references
                if client.server_capabilities.documentHighlightProvider then
                    vim.api.nvim_create_augroup("lsp_document_highlight", {
                        clear = false,
                    })
                    vim.api.nvim_clear_autocmds({
                        group = "lsp_document_highlight",
                        buffer = bufnr,
                    })
                    vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
                        group = "lsp_document_highlight",
                        buffer = bufnr,
                        callback = vim.lsp.buf.document_highlight,
                    })
                    vim.api.nvim_create_autocmd("CursorMoved", {
                        group = "lsp_document_highlight",
                        buffer = bufnr,
                        callback = vim.lsp.buf.clear_references,
                    })
                end
            end

            local servers = {
                lua_ls = {
                    settings = {
                        Lua = {
                            runtime = { version = "LuaJIT" },
                            diagnostics = {
                                globals = { "vim" },
                            },
                            workspace = {
                                library = vim.api.nvim_get_runtime_file("", true),
                                checkThirdParty = false,
                            },
                            telemetry = { enable = false },
                        },
                    },
                },
                clangd = {},
                pyright = {},
            }

            local capabilities = require("cmp_nvim_lsp").default_capabilities()

            local lspconfig = require("lspconfig")
            for server, config in pairs(servers) do
                lspconfig[server].setup(vim.tbl_deep_extend("force", {
                    on_attach = on_attach,
                    capabilities = vim.deepcopy(capabilities),
                }, config))
            end
        end,
    },
}
