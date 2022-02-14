require("lsp.ui")

local function on_attach(client, bufnr)
    require("lsp.mappings").setup(bufnr)
    require("lsp.highlight").setup(client)
    require("lsp_signature").on_attach({
        bind = true,
        handler_opts = {
            border = "rounded",
        },
        hint_enable = false,
    }, bufnr)

    vim.cmd([[
    augroup nvim_lightbulb
        autocmd! * <buffer>
        autocmd CursorHold,CursorHoldI <buffer> lua require('nvim-lightbulb').update_lightbulb()
    augroup END
    ]])
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
    texlab = {},
    vuels = {},
    cmake = {},
    rust_analyzer = {},
}

local capabilities = require("cmp_nvim_lsp").update_capabilities(
    vim.lsp.protocol.make_client_capabilities()
)

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
