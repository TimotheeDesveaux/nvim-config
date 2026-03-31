local M = {}

function M.augroup(name, clear)
    clear = clear ~= false
    return vim.api.nvim_create_augroup("my_" .. name, { clear = clear })
end

function M.get_or_default(value, default)
    if value ~= nil then
        return value
    else
        return default
    end
end

function M.github(repo)
    return "https://github.com/" .. repo
end

return M
