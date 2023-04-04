local M = {}

function M.attach(bufnr)
    local function map(key, rhs, desc)
        vim.keymap.set("n", key, rhs, {
            silent = true,
            buffer = bufnr,
            desc = desc,
        })
    end

    map("K", ":lua vim.lsp.buf.hover()<CR>", "")
    map("<leader>lD", ":lua vim.lsp.buf.declaration()<CR>", "declaration")
    map("<leader>ld", ":Telescope lsp_definitions<CR>", "definition")
    map("<leader>li", ":Telescope lsp_implementations<CR>", "implementation")
    map("<leader>lt", ":Telescope lsp_type_definitions<CR>", "type defintion")
    map("<leader>lr", ":Telescope lsp_references<CR>", "references")
    map("<leader>ln", ":lua vim.lsp.buf.rename()<CR>", "rename")
    map("<leader>la", ":lua vim.lsp.buf.code_action()<CR>", "action")
    map("<leader>lk", ":lua vim.diagnostic.goto_prev()<CR>", "previous diagnostic")
    map("<leader>lj", ":lua vim.diagnostic.goto_next()<CR>", "next diagnostic")
    map(
        "<leader>ls",
        ":lua vim.diagnostic.open_float({ scope = 'cursor' })<CR>",
        "cursor diagnostic"
    )
    map("<leader>lS", ":lua vim.diagnostic.open_float({ scope = 'line' })<CR>", "line diagnostics")
    map("<leader>ly", ":Telescope lsp_document_symbols<CR>", "LSP symbols")
end

return M
