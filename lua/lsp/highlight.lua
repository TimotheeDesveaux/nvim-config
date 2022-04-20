local M = {}

function M.setup(client)
    if client.resolved_capabilities.document_highlight then
        local highlight_group = vim.api.nvim_create_augroup("lsp_highlight", {})
        vim.api.nvim_create_autocmd("CursorHold", {
            callback = vim.lsp.buf.document_highlight,
            group = highlight_group,
            buffer = 0,
        })
        vim.api.nvim_create_autocmd("CursorMoved", {
            callback = vim.lsp.buf.clear_references,
            group = highlight_group,
            buffer = 0,
        })
    end
end

return M
