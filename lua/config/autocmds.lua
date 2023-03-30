local function augroup(name)
    return vim.api.nvim_create_augroup("my_" .. name, { clear = true })
end

vim.filetype.add({
    extension = {
        h = "c",
        ll = "lex",
        tig = "tiger",
        tih = "tiger",
    },
    filename = {
        ["local.am"] = "automake",
    },
})

vim.api.nvim_create_autocmd("FileType", {
    group = augroup("use_tabs"),
    pattern = { "make", "go" },
    command = "setlocal noexpandtab shiftwidth=8",
})

vim.api.nvim_create_autocmd("FileType", {
    group = augroup("markdown"),
    pattern = "markdown",
    callback = function()
        vim.opt_local.textwidth = 80
        vim.keymap.set(
            "n",
            "<leader>mp",
            "<cmd>silent !pandoc % -o %:r.pdf<CR>",
            { desc = "to pdf", buffer = 0 }
        )
        vim.keymap.set(
            "n",
            "<leader>mv",
            "<cmd>silent !zathura %:r.pdf &<CR>",
            { desc = "visualize", buffer = 0 }
        )
    end,
})

vim.api.nvim_create_autocmd("TextYankPost", {
    group = augroup("highlight_yank"),
    callback = function()
        vim.highlight.on_yank({ higroup = "Visual", on_visual = false })
    end,
})

vim.api.nvim_create_autocmd({ "FocusGained", "TermClose", "TermLeave" }, {
    group = augroup("checktime"),
    command = "checktime",
})

vim.api.nvim_create_autocmd({ "VimResized" }, {
    group = augroup("resize_splits"),
    callback = function()
        vim.cmd("tabdo wincmd =")
    end,
})
