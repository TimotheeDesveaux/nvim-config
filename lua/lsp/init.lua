require("lsp.ui")

local function on_attach(client, bufnr)
    require("lsp.mappings").setup(bufnr)
    require("lsp.highlight").setup(client, bufnr)
    require("lsp.lightbulb").setup(bufnr)
end

local sumneko_config = require("lsp.sumneko")

local servers = {
    pyright = {},
    sumneko_lua = sumneko_config,
    bashls = {},
    -- dockerls = {},
    tsserver = {},
    -- html = {},
    -- emmet_ls = {},
    -- cssls = {},
    -- tailwindcss = {},
    texlab = {},
    -- vuels = {},
    -- cmake = {},
    -- rust_analyzer = {},
}

local capabilities = require("cmp_nvim_lsp").default_capabilities()

local lspconfig = require("lspconfig")
for server, config in pairs(servers) do
    lspconfig[server].setup(vim.tbl_deep_extend("force", {
        on_attach = on_attach,
        capabilities = capabilities,
    }, config))
end

local clangd_capabilities = vim.deepcopy(capabilities)
clangd_capabilities.textDocument.completion.completionItem.snippetSupport =
    false
lspconfig.clangd.setup({
    on_attach = on_attach,
    capabilities = clangd_capabilities,
})

local rt = require("rust-tools")
rt.setup({
    server = {
        on_attach = on_attach,
    },
})
