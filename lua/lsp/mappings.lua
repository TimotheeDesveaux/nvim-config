local M = {}
local util = require("utils")

function M.setup(bufnr)
    local opts = {
        silent = true,
        buffer = bufnr
    }

    util.nnoremap("<leader>lD", "<Cmd>lua vim.lsp.buf.declaration()<CR>", opts)
    util.nnoremap("<leader>ld", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
    util.nnoremap("K",
                  "<cmd>lua require('lspsaga.hover').render_hover_doc()<CR>",
                  opts)
    util.nnoremap("<leader>li", "<cmd>lua vim.lsp.buf.implementation()<CR>",
                  opts)
    util.nnoremap("<leader>ly", "<cmd>lua vim.lsp.buf.type_definition()<CR>",
                  opts)
    util.nnoremap("<leader>ln",
                  "<cmd>lua require('lspsaga.rename').rename()<CR>", opts)
    util.nnoremap("<leader>la",
                  "<cmd>lua require('lspsaga.codeaction').code_action()<CR>",
                  opts)
    util.nnoremap("<leader>lr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
    util.nnoremap("<leader>lk",
                  "<cmd>lua require('lspsaga.diagnostic').lsp_jump_diagnostic_prev()<CR>",
                  opts)
    util.nnoremap("<leader>lj",
                  "<cmd>lua require('lspsaga.diagnostic').lsp_jump_diagnostic_next()<CR>",
                  opts)
    util.nnoremap("<leader>ls",
                  "<cmd>lua require('lspsaga.signaturehelp').signature_help()<CR>",
                  opts)
    util.nnoremap("<C-f>",
                  "<cmd>lua require('lspsaga.action').smart_scroll_with_saga(1)<CR>",
                  opts)
    util.nnoremap("<C-b>",
                  "<cmd>lua require('lspsaga.action').smart_scroll_with_saga(-1)<CR>",
                  opts)
end

return M
