local lspconfig = require("lspconfig")

local function on_attach(client, bufnr)
    require("lsp.mappings").setup(client, bufnr)

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

for server, config in pairs(servers) do
    lspconfig[server].setup(vim.tbl_deep_extend("force", {
        on_attach = on_attach,
        capabilities = capabilities
    }, config))
end

-- Diagnostics symbols
require("lspsaga").init_lsp_saga {
    error_sign = "",
    warn_sign = "",
    hint_sign = "",
    infor_sign = "",
    code_action_icon = "",
    code_action_prompt = {
        enable = true,
        sign = false,
        virtual_text = true
    }
}
