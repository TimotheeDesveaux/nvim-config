local M = {}

function M.attach(bufnr)
    local function set_keymap(key, rhs, desc)
        vim.keymap.set("n", "<leader>l" .. key, rhs, {
            silent = true,
            buffer = bufnr,
            desc = desc,
        })
    end

    vim.keymap.set("n", "K", ":lua vim.lsp.buf.hover()<CR>", { silent = true, buffer = bufnr })
    set_keymap("D", ":lua vim.lsp.buf.declaration()<CR>", "declaration")
    set_keymap("d", ":Telescope lsp_definitions<CR>", "definition")
    set_keymap("i", ":Telescope lsp_implementations<CR>", "implementation")
    set_keymap("t", ":Telescope lsp_type_definitions<CR>", "type defintion")
    set_keymap("r", ":Telescope lsp_references<CR>", "references")
    set_keymap("n", ":lua vim.lsp.buf.rename()<CR>", "rename")
    set_keymap("a", ":lua vim.lsp.buf.code_action()<CR>", "action")
    set_keymap("k", ":lua vim.diagnostic.goto_prev()<CR>", "previous diagnostic")
    set_keymap("j", ":lua vim.diagnostic.goto_next()<CR>", "next diagnostic")
    set_keymap("s", ":lua vim.diagnostic.open_float({ scope = 'cursor' })<CR>", "cursor diagnostic")
    set_keymap("S", ":lua vim.diagnostic.open_float({ scope = 'line' })<CR>", "line diagnostics")
    set_keymap("y", ":Telescope lsp_document_symbols<CR>", "LSP symbols")
end

return M
