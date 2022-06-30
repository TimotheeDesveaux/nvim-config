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
        D = { "<cmd>lua vim.lsp.buf.declaration()<CR>", "declaration" },
        d = { "<cmd>Telescope lsp_definitions<CR>", "definition" },
        i = { "<cmd>Telescope lsp_implementations<CR>", "implementation" },
        t = { "<cmd>Telescope lsp_type_definitions<CR>", "type defintion" },
        r = { "<cmd>Telescope lsp_references<CR>", "references" },
        n = { "<cmd>lua vim.lsp.buf.rename()<CR>", "rename" },
        a = { "<cmd>lua vim.lsp.buf.code_action()<CR>", "action" },
        k = {
            "<cmd>lua vim.diagnostic.goto_prev()<CR>",
            "previous diagnostic",
        },
        j = { "<cmd>lua vim.diagnostic.goto_next()<CR>", "next diagnostic" },
        s = {
            "<cmd>lua vim.diagnostic.open_float({ scope = 'cursor' })<CR>",
            "show cursor diagnostic",
        },
        S = {
            "<cmd>lua vim.diagnostic.open_float({ scope = 'line' })<CR>",
            "show line diagnostics",
        },
        y = { "<cmd>Telescope lsp_document_symbols<CR>", "LSP symbols" },
    }

    opts.prefix = "<leader>l"
    wk.register(lsp_keys, opts)
end

return M
