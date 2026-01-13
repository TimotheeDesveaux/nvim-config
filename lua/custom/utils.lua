local M = {}

function M.augroup(name, clear)
    clear = clear ~= false
    return vim.api.nvim_create_augroup("custom_" .. name, { clear = clear })
end

function M.telescope(builtin)
    return function()
        require("telescope.builtin")[builtin]()
    end
end

function M.get_or_default(value, default)
    if value ~= nil then
        return value
    else
        return default
    end
end

return M
