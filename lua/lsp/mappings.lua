local M = {}
local util = require("utils")
local wk = require("which-key")

function M.setup(bufnr)
    local opts = {
        noremap = true,
        silent = true,
        buffer = bufnr
    }

    util.nmap("K", "<cmd>lua require('lspsaga.hover').render_hover_doc()<CR>",
              opts)
    util.nmap("<C-f>",
              "<cmd>lua require('lspsaga.action').smart_scroll_with_saga(1)<CR>",
              opts)
    util.nmap("<C-b>",
              "<cmd>lua require('lspsaga.action').smart_scroll_with_saga(-1)<CR>",
              opts)

    local lsp_keys = {
        name = "lsp",
        D = {"<Cmd>lua vim.lsp.buf.declaration()<CR>", "declaration"},
        d = {"<Cmd>lua vim.lsp.buf.definition()<CR>", "definition"},
        i = {"<Cmd>lua vim.lsp.buf.implementation()<CR>", "implementation"},
        y = {"<Cmd>lua vim.lsp.buf.type_definition()<CR>", "type defintion"},
        r = {"<cmd>lua vim.lsp.buf.references()<CR>", "references"},
        n = {"<cmd>lua require('lspsaga.rename').rename()<CR>", "rename"},
        a = {
            "<cmd>lua require('lspsaga.codeaction').code_action()<CR>",
            "action"
        },
        k = {
            "<cmd>lua require('lspsaga.diagnostic').lsp_jump_diagnostic_prev()<CR>",
            "previous diagnostic"
        },
        j = {
            "<cmd>lua require('lspsaga.diagnostic').lsp_jump_diagnostic_next()<CR>",
            "next diagnostic"
        },
        s = {
            "<cmd>lua require('lspsaga.signaturehelp').signature_help()<CR>",
            "signature"
        }
    }

    opts.prefix = "<leader>l"
    wk.register(lsp_keys, opts)
end

return M
