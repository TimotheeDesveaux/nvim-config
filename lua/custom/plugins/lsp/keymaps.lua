local M = {}

function M.on_attach(bufnr)
    local fzf = require("custom.utils").fzf

    local function map(key, rhs, desc)
        vim.keymap.set("n", key, rhs, {
            silent = true,
            buffer = bufnr,
            desc = desc,
        })
    end

    map("<leader>lD", vim.lsp.buf.declaration, "declaration")
    map("<leader>ld", fzf("lsp_definitions"), "definition")
    map("<leader>li", fzf("lsp_implementations"), "implementation")
    map("<leader>lt", fzf("lsp_typedefs"), "type defintion")
    map("<leader>lr", fzf("lsp_references"), "references")
    map("<leader>ly", fzf("lsp_document_symbols"), "LSP symbols")

    map("<leader>ln", vim.lsp.buf.rename, "rename")
    map("<leader>la", vim.lsp.buf.code_action, "action")

    map("<leader>lk", function()
        vim.diagnostic.jump({ count = -1, float = true })
    end, "previous diagnostic")
    map("<leader>lj", function()
        vim.diagnostic.jump({ count = 1, float = true })
    end, "next diagnostic")
    map("<leader>ls", function()
        vim.diagnostic.open_float({ scope = "cursor" })
    end, "cursor diagnostic")
    map("<leader>lS", function()
        vim.diagnostic.open_float({ scope = "line" })
    end, "line diagnostics")

    map("<leader>lh", function()
        vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
    end, "toggle inlay hints")
end

return M
