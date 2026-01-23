local M = {}

function M.augroup(name, clear)
    clear = clear ~= false
    return vim.api.nvim_create_augroup("custom_" .. name, { clear = clear })
end

function M.fzf(command)
    return function()
        require("fzf-lua")[command]()
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
