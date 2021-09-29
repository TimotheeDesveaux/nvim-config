require("lsp.clangd")
require("lsp.python")
require("lsp.lua")
require("lsp.bash")
require("lsp.docker")
require("lsp.javascript")
require("lsp.html")
require("lsp.css")
require("lsp.vue")

-- Mappings.
local util = require("utils")
local opts = {
    noremap = true,
    silent = true
}
util.nmap("<leader>lD", "<Cmd>lua vim.lsp.buf.declaration()<CR>", opts)
util.nmap("<leader>ld", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
util.nmap("K", "<cmd>lua require('lspsaga.hover').render_hover_doc()<CR>", opts)
util.nmap("<leader>li", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
util.nmap("<leader>ly", "<cmd>lua vim.lsp.buf.type_definition()<CR>", opts)
util.nmap("<leader>ln", "<cmd>lua require('lspsaga.rename').rename()<CR>", opts)
util.nmap("<leader>la",
          "<cmd>lua require('lspsaga.codeaction').code_action()<CR>", opts)
util.nmap("<leader>lr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
util.nmap("<leader>lk",
          "<cmd>lua require('lspsaga.diagnostic').lsp_jump_diagnostic_prev()<CR>",
          opts)
util.nmap("<leader>lj",
          "<cmd>lua require('lspsaga.diagnostic').lsp_jump_diagnostic_next()<CR>",
          opts)
util.nmap("<leader>ls",
          "<cmd>lua require('lspsaga.signaturehelp').signature_help()<CR>", opts)
util.nmap("<C-f>",
          "<cmd>lua require('lspsaga.action').smart_scroll_with_saga(1)<CR>",
          opts)
util.nmap("<C-b>",
          "<cmd>lua require('lspsaga.action').smart_scroll_with_saga(-1)<CR>",
          opts)

vim.cmd [[
autocmd CursorHold * lua require('lspsaga.diagnostic').show_cursor_diagnostics()
]]

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
