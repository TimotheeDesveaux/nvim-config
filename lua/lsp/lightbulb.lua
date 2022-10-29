local M = {}

local lb = require("nvim-lightbulb")

function M.setup(bufnr)
    lb.setup({
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
        callback = lb.update_lightbulb,
        buffer = bufnr,
    })
end

return M
