local check_back_space = function()
    local line, col = unpack(vim.api.nvim_win_get_cursor(0))
    return col == 0 or vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match('%s') ~= nil
end

local cmp = require('cmp')
cmp.setup {
    sources = {
        { name = 'nvim_lsp' },
        { name = 'path' },
        { name = 'buffer' },
        { name = 'calc' }
    },
    mapping = {
        ['<C-p>'] = cmp.mapping.select_prev_item(),
        ['<C-n>'] = cmp.mapping.select_next_item(),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.close(),
        ['<Tab>'] = function(fallback)
            if vim.fn.pumvisible() == 1 then
                vim.fn.feedkeys(vim.api.nvim_replace_termcodes('<C-n>', true, true, true), 'n')
            elseif check_back_space() then
                vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes('<Tab>', true, true, true), 'n', true)
            else
                fallback()
            end
        end,
        ['<S-Tab>'] = function(fallback)
            if vim.fn.pumvisible() == 1 then
                vim.fn.feedkeys(vim.api.nvim_replace_termcodes('<C-p>', true, true, true), 'n')
            elseif check_back_space() then
                vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes('<S-Tab>', true, true, true), 'n', true)
            else
                fallback()
            end
        end,
    }
}
