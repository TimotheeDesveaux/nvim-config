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
        local current_tab = vim.api.nvim_get_current_tabpage()
        vim.cmd("tabdo wincmd =")
        vim.api.nvim_set_current_tabpage(current_tab)
    end,
})

vim.api.nvim_create_autocmd({ "BufEnter", "FocusGained", "InsertLeave", "WinEnter", "CmdlineLeave" }, {
    group = augroup("enable_relative_number"),
    callback = function()
        if not vim.opt.number:get() and not vim.opt.relativenumber:get() then
            return
        end

        vim.opt.relativenumber = vim.api.nvim_get_mode() ~= "i"
    end,
})

vim.api.nvim_create_autocmd({ "BufLeave", "FocusLost", "InsertEnter", "WinLeave", "CmdlineEnter" }, {
    group = augroup("disable_relative_number"),
    callback = function(ev)
        vim.opt.relativenumber = false

        if ev.event == "CmdlineEnter" then
            vim.cmd("redraw")
        end
    end,
})
