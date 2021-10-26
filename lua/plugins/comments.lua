local wk = require("which-key")

vim.g.NERDSpaceDelims = 1
vim.g.NERDDefaultAlign = "left"

local normal_mappings = {
    name = "comments",
    ["$"] = "to end of line",
    ["<space>"] = "toggle",
    A = "append",
    a = "alternative delimiters",
    b = "align both",
    c = "comment",
    i = "invert",
    l = "align left",
    m = "minimal",
    n = "nested",
    s = "sexy",
    u = "uncomment",
    y = "yank",
}

wk.register(normal_mappings, {
    mode = "n",
    prefix = "<leader>c",
})

local visual_mappings = {
    name = "comments",
    ["<space>"] = "toggle",
    b = "align both",
    c = "comment",
    i = "invert",
    l = "align left",
    m = "minimal",
    n = "nested",
    s = "sexy",
    u = "uncomment",
    y = "yank",
}

wk.register(visual_mappings, {
    mode = "v",
    prefix = "<leader>c",
})
