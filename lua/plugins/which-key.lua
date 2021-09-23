require("which-key").register({
    ["<space>"] = "previous file",
    l = {
        name = "lsp",
        n = "rename",
        d = "definition",
        D = "declaration",
        y = "type definition",
        i = "implementation",
        r = "references",
        j = "next diagnostic",
        k = "previous diagnostic",
        a = "action",
        s = "signature"
    },
    f = {
        name = "fuzzy finder (telescope)",
        f = "files",
        g = "git files",
        r = "grep",
        b = "buffers",
        m = "bookmarks",
        c = "colorscheme",
        h = "history"
    },
    c = {
        name = "NERDCommenter",
        c = "comment",
        i = "invert",
        u = "uncomment",
        s = "sexy",
        n = "nested",
        ["$"] = "to end of line",
        m = "minimal"
    },
    -- TODO: Only when in markdown file
    m = {
        name = "markdown",
        p = "to pdf",
        v = "visualize"
    },
    s = {
        name = "Session",
        s = "save",
        l = "load"
    }
}, {
    prefix = "<leader>"
})
