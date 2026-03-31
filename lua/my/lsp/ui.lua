local M = {}

function M.setup()
    vim.diagnostic.config({
        signs = {
            text = {
                [vim.diagnostic.severity.ERROR] = "",
                [vim.diagnostic.severity.WARN] = "",
                [vim.diagnostic.severity.HINT] = "",
                [vim.diagnostic.severity.INFO] = "",
            },
        },
    })

    local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
    function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
        opts = opts or {}
        opts.border = "rounded"
        return orig_util_open_floating_preview(contents, syntax, opts, ...)
    end
end

function M.on_attach(client, bufnr)
    -- Highlight references
    if client.server_capabilities.documentHighlightProvider then
        vim.api.nvim_create_augroup("lsp_document_highlight", {
            clear = false,
        })
        vim.api.nvim_clear_autocmds({
            group = "lsp_document_highlight",
            buffer = bufnr,
        })
        vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
            group = "lsp_document_highlight",
            buffer = bufnr,
            callback = vim.lsp.buf.document_highlight,
        })
        vim.api.nvim_create_autocmd("CursorMoved", {
            group = "lsp_document_highlight",
            buffer = bufnr,
            callback = vim.lsp.buf.clear_references,
        })
    end
end

return M
