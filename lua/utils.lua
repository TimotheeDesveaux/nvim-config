local M = {}

local map = function(mode, key, cmd, opts)
    return vim.api.nvim_set_keymap(mode, key, cmd, opts)
end

function M.map(key, cmd, opts)
    return map('', key, cmd, opts)
end

function M.nmap(key, cmd, opts)
    return map('n', key, cmd, opts)
end

function M.vmap(key, cmd, opts)
    return map('v', key, cmd, opts)
end

function M.imap(key, cmd, opts)
    return map('i', key, cmd, opts)
end

function M.smap(key, cmd, opts)
    return map('s', key, cmd, opts)
end

function M.noremap(key, cmd)
    return map('', key, cmd, { noremap = true })
end

function M.nnoremap(key, cmd)
    return map('n', key, cmd, { noremap = true })
end

function M.vnoremap(key, cmd)
    return map('v', key, cmd, { noremap = true })
end

function M.inoremap(key, cmd)
    return map('i', key, cmd, { noremap = true })
end

function M.snoremap(key, cmd)
    return map('s', key, cmd, { noremap = true })
end

return M
