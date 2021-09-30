-- Mappings.
local lspconfig = require("lspconfig")

local function on_attach(client, bufnr)
    local opts = {
        noremap = true,
        silent = true
    }

    local function buf_nmap(key, cmd)
        return vim.api.nvim_buf_set_keymap(bufnr, key, cmd, opts)
    end

    buf_nmap("<leader>lD", "<Cmd>lua vim.lsp.buf.declaration()<CR>")
    buf_nmap("<leader>ld", "<cmd>lua vim.lsp.buf.definition()<CR>")
    buf_nmap("K", "<cmd>lua require('lspsaga.hover').render_hover_doc()<CR>")
    buf_nmap("<leader>li", "<cmd>lua vim.lsp.buf.implementation()<CR>")
    buf_nmap("<leader>ly", "<cmd>lua vim.lsp.buf.type_definition()<CR>")
    buf_nmap("<leader>ln", "<cmd>lua require('lspsaga.rename').rename()<CR>")
    buf_nmap("<leader>la",
             "<cmd>lua require('lspsaga.codeaction').code_action()<CR>")
    buf_nmap("<leader>lr", "<cmd>lua vim.lsp.buf.references()<CR>")
    buf_nmap("<leader>lk",
             "<cmd>lua require('lspsaga.diagnostic').lsp_jump_diagnostic_prev()<CR>")
    buf_nmap("<leader>lj",
             "<cmd>lua require('lspsaga.diagnostic').lsp_jump_diagnostic_next()<CR>")
    buf_nmap("<leader>ls",
             "<cmd>lua require('lspsaga.signaturehelp').signature_help()<CR>")
    buf_nmap("<C-f>",
             "<cmd>lua require('lspsaga.action').smart_scroll_with_saga(1)<CR>")
    buf_nmap("<C-b>",
             "<cmd>lua require('lspsaga.action').smart_scroll_with_saga(-1)<CR>")

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
