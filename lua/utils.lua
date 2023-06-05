local M = {}

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
