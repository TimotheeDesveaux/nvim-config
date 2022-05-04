local M = {}

function M.setup(bufnr)
    require("nvim-lightbulb").setup({
        sign = {
            enabled = false,
        },
        virtual_text = {
            enabled = true,
            text = "",
            hl_mode = "replace",
        },
    })

    vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
        callback = require("nvim-lightbulb").update_lightbulb,
        buffer = bufnr,
    })
end

return M
