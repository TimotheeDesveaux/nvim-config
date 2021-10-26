local M = {}
local util = require("utils")
local wk = require("which-key")

function M.setup(bufnr)
    local opts = {
        noremap = true,
        silent = true,
        buffer = bufnr,
    }

    util.nmap("K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)

    local lsp_keys = {
        name = "lsp",
        D = { "<Cmd>lua vim.lsp.buf.declaration()<CR>", "declaration" },
        d = { "<Cmd>lua vim.lsp.buf.definition()<CR>", "definition" },
        i = { "<Cmd>lua vim.lsp.buf.implementation()<CR>", "implementation" },
        t = { "<Cmd>lua vim.lsp.buf.type_definition()<CR>", "type defintion" },
        r = { "<cmd>lua vim.lsp.buf.references()<CR>", "references" },
        n = { "<cmd>lua vim.lsp.buf.rename()<CR>", "rename" },
        a = { "<cmd>lua vim.lsp.buf.code_action()<CR>", "action" },
        k = {
            "<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>",
            "previous diagnostic",
        },
        j = { "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>", "next diagnostic" },
        s = {
            "<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>",
            "show diagnostics",
        },
    }

    opts.prefix = "<leader>l"
    wk.register(lsp_keys, opts)
end

return M
