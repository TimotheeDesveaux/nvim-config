require("lsp.saga")

local function on_attach(client, bufnr)
    require("lsp.mappings").setup(bufnr)
    require("lsp.highlight").setup(client)
    require("lsp_signature").on_attach {
        hint_prefix = " "
    }

    vim.cmd [[
        autocmd CursorHold * lua require('lspsaga.diagnostic').show_cursor_diagnostics()
    ]]
end

local sumneko_config = require("lsp.sumneko")

local servers = {
    pyright = {},
    sumneko_lua = sumneko_config,
    bashls = {},
    dockerls = {},
    tsserver = {},
    html = {},
    emmet_ls = {},
    cssls = {},
    tailwindcss = {},
    vuels = {},
    cmake = {}
}

local capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp
                                                                     .protocol
                                                                     .make_client_capabilities())

local lspconfig = require("lspconfig")
for server, config in pairs(servers) do
    lspconfig[server].setup(vim.tbl_deep_extend("force", {
        on_attach = on_attach,
        capabilities = capabilities
    }, config))
end

capabilities.textDocument.completion.completionItem.snippetSupport = false
lspconfig.clangd.setup {
    on_attach = on_attach,
    capabilities = capabilities
}
