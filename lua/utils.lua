local M = {}

M.functions = {}

local map = function(mode, key, cmd, opts, defaults)
    opts = vim.tbl_deep_extend("force", defaults or {}, opts or {})

    if opts.buffer ~= nil then
        local buffer = opts.buffer
        opts.buffer = nil
        return vim.api.nvim_buf_set_keymap(buffer, mode, key, cmd, opts)
    else
        return vim.api.nvim_set_keymap(mode, key, cmd, opts)
    end
end

function M.map(key, cmd, opts)
    return map("", key, cmd, opts)
end

function M.nmap(key, cmd, opts)
    return map("n", key, cmd, opts)
end

function M.vmap(key, cmd, opts)
    return map("v", key, cmd, opts)
end

function M.xmap(key, cmd, opts)
    return map("x", key, cmd, opts)
end

function M.imap(key, cmd, opts)
    return map("i", key, cmd, opts)
end

function M.omap(key, cmd, opts)
    return map("o", key, cmd, opts)
end

function M.smap(key, cmd, opts)
    return map("s", key, cmd, opts)
end

function M.noremap(key, cmd, opts)
    return map("", key, cmd, opts, {
        noremap = true,
    })
end

function M.nnoremap(key, cmd, opts)
    return map("n", key, cmd, opts, {
        noremap = true,
    })
end

function M.vnoremap(key, cmd, opts)
    return map("v", key, cmd, opts, {
        noremap = true,
    })
end

function M.xnoremap(key, cmd, opts)
    return map("x", key, cmd, opts, {
        noremap = true,
    })
end

function M.inoremap(key, cmd, opts)
    return map("i", key, cmd, opts, {
        noremap = true,
    })
end

function M.onoremap(key, cmd, opts)
    return map("o", key, cmd, opts, {
        noremap = true,
    })
end

function M.snoremap(key, cmd, opts)
    return map("s", key, cmd, opts, {
        noremap = true,
    })
end

return M
