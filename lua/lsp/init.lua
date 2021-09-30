require("lsp.saga")

local function on_attach(client, bufnr)
    require("lsp.mappings").setup(bufnr)
    require("lsp.highlight").setup(client)

    vim.cmd [[
        autocmd CursorHold * lua require('lspsaga.diagnostic').show_cursor_diagnostics()
    ]]
end

local sumneko_config = require("lsp.sumneko")

local servers = {
    clangd = {},
    pyright = {},
    sumneko_lua = sumneko_config,
    bashls = {},
    dockerls = {},
    tsserver = {},
    html = {},
    cssls = {},
    vuels = {}
}

local capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp
                                                                     .protocol
                                                                     .make_client_capabilities())
capabilities.textDocument.completion.completionItem.snippetSupport = true

local lspconfig = require("lspconfig")
for server, config in pairs(servers) do
    lspconfig[server].setup(vim.tbl_deep_extend("force", {
        on_attach = on_attach,
        capabilities = capabilities
    }, config))
end
