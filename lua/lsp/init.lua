require('lsp.clangd-ls')
require('lsp.python-ls')
require('lsp.lua-ls')

-- Mappings.
local util = require('utils')
local opts = { noremap=true, silent=true }
util.nmap('<leader>lD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
util.nmap('<leader>ld', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
util.nmap('K', '<cmd>lua require(\'lspsaga.hover\').render_hover_doc()<CR>', opts)
util.nmap('<leader>li', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
util.nmap('<leader>ly', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
util.nmap('<leader>ln', '<cmd>lua require(\'lspsaga.rename\').rename()<CR>', opts)
util.nmap('<leader>la', '<cmd>lua require(\'lspsaga.codeaction\').code_action()<CR>', opts)
util.nmap('<leader>lr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
util.nmap('<leader>lk', '<cmd>lua require(\'lspsaga.diagnostic\').lsp_jump_diagnostic_prev()<CR>', opts)
util.nmap('<leader>lj', '<cmd>lua require(\'lspsaga.diagnostic\').lsp_jump_diagnostic_next()<CR>', opts)
util.nmap('<leader>ls', '<cmd>lua require(\'lspsaga.signaturehelp\').signature_help()<CR>', opts)

vim.cmd(
[[
autocmd CursorHold * lua require('lspsaga.diagnostic').show_cursor_diagnostics()
]])

local function documentHighlight(client)
    -- Set autocommands conditional on server_capabilities
    if client.resolved_capabilities.document_highlight then
        vim.api.nvim_exec(
        [[
        hi LspReferenceRead cterm=bold ctermbg=red guibg=#404040
        hi LspReferenceText cterm=bold ctermbg=red guibg=#404040
        hi LspReferenceWrite cterm=bold ctermbg=red guibg=#404040
        augroup lsp_document_highlight
        autocmd! * <buffer>
        autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
        autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
        augroup END
        ]], false)
    end
end

-- sumneko_lua does not work for some reason
local servers = { "pyright", "clangd" }
for _, lsp in ipairs(servers) do
    require('lspconfig')[lsp].setup { on_attach = documentHighlight }
end

-- Diagnostics symbols
require('lspsaga').init_lsp_saga {
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
