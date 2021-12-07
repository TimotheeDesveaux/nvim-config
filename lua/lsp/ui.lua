local colors = require("tokyonight.colors").setup({ darkFloat = true })

local signs = {
    DiagnosticSignError = "",
    DiagnosticSignWarn = "",
    DiagnosticSignHint = "",
    DiagnosticSignInfo = "",
    LightBulbSign = "",
}

for hl, icon in pairs(signs) do
    vim.fn.sign_define(hl, {
        text = icon,
        texthl = hl,
        numhl = hl,
    })
end

vim.cmd(
    ("autocmd ColorScheme * highlight FloatBorder guifg=%s guibg=%s"):format(
        colors.border_highlight,
        colors.bg_float
    )
)

local border = {
    { "╭", "FloatBorder" },
    { "─", "FloatBorder" },
    { "╮", "FloatBorder" },
    { "│", "FloatBorder" },
    { "╯", "FloatBorder" },
    { "─", "FloatBorder" },
    { "╰", "FloatBorder" },
    { "│", "FloatBorder" },
}

local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
    opts = opts or {}
    opts.border = opts.border or border
    return orig_util_open_floating_preview(contents, syntax, opts, ...)
end
