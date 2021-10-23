local signs = {
    LspDiagnosticsSignError = "",
    LspDiagnosticsSignWarning = "",
    LspDiagnosticsSignHint = "",
    LspDiagnosticsSignInformation = "",
    LightBulbSign = ""
}

for hl, icon in pairs(signs) do
    vim.fn.sign_define(hl, {
        text = icon,
        texthl = hl,
        numhl = hl
    })
end

local function on_attach(client, bufnr)
    require("lsp.mappings").setup(bufnr)
    require("lsp.highlight").setup(client)
    require("lsp_signature").on_attach({
        bind = true,
        handler_opts = {
            border = "none"
        },
        hint_enable = false
    }, bufnr)

    vim.cmd [[
    augroup nvim_lightbulb
        autocmd! * <buffer>
        autocmd CursorHold,CursorHoldI <buffer> lua require('nvim-lightbulb').update_lightbulb()
    augroup END
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
