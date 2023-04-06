local M = {}

function M.attach(bufnr)
    local function map(key, rhs, desc)
        vim.keymap.set("n", key, rhs, {
            silent = true,
            buffer = bufnr,
            desc = desc,
        })
    end

    map("K", "<Cmd>lua vim.lsp.buf.hover()<CR>", "")
    map("<leader>lD", "<Cmd>lua vim.lsp.buf.declaration()<CR>", "declaration")
    map("<leader>ld", "<Cmd>Telescope lsp_definitions<CR>", "definition")
    map("<leader>li", "<Cmd>Telescope lsp_implementations<CR>", "implementation")
    map("<leader>lt", "<Cmd>Telescope lsp_type_definitions<CR>", "type defintion")
    map("<leader>lr", "<Cmd>Telescope lsp_references<CR>", "references")
    map("<leader>ln", "<Cmd>lua vim.lsp.buf.rename()<CR>", "rename")
    map("<leader>la", "<Cmd>lua vim.lsp.buf.code_action()<CR>", "action")
    map("<leader>lk", "<Cmd>lua vim.diagnostic.goto_prev()<CR>", "previous diagnostic")
    map("<leader>lj", "<Cmd>lua vim.diagnostic.goto_next()<CR>", "next diagnostic")
    map(
        "<leader>ls",
        "<Cmd>lua vim.diagnostic.open_float({ scope = 'cursor' })<CR>",
        "cursor diagnostic"
    )
    map(
        "<leader>lS",
        "<Cmd>lua vim.diagnostic.open_float({ scope = 'line' })<CR>",
        "line diagnostics"
    )
    map("<leader>ly", "<Cmd>Telescope lsp_document_symbols<CR>", "LSP symbols")
end

return M
