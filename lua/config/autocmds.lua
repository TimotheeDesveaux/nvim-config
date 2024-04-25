local function augroup(name)
    return vim.api.nvim_create_augroup("my_" .. name, { clear = false })
end

vim.filetype.add({
    extension = {
        h = "c",
        ll = "lex",
        tig = "tiger",
        tih = "tiger",
        tex = "tex",
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

local function markup_language(ft, cmd)
    vim.api.nvim_create_autocmd("FileType", {
        group = augroup(ft),
        pattern = ft,
        callback = function()
            vim.opt_local.textwidth = 80
            vim.keymap.set("n", "<leader>pt", cmd, { desc = "to pdf", buffer = 0 })
            vim.keymap.set(
                "n",
                "<leader>pv",
                "<Cmd>silent !zathura %:r.pdf &<CR>",
                { desc = "visualize", buffer = 0 }
            )
        end,
    })
end
markup_language("markdown", "<Cmd>!pandoc % -o %:r.pdf<CR>")
markup_language("tex", "<Cmd>TexlabBuild<CR>")

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

vim.api.nvim_create_autocmd("VimResized", {
    group = augroup("resize_splits"),
    callback = function()
        local current_tab = vim.api.nvim_get_current_tabpage()
        vim.cmd("tabdo wincmd =")
        vim.api.nvim_set_current_tabpage(current_tab)
    end,
})

vim.api.nvim_create_autocmd(
    { "BufEnter", "FocusGained", "InsertLeave", "WinEnter", "CmdlineLeave" },
    {
        group = augroup("toggle_relative_number"),
        callback = function()
            if not vim.opt.number:get() and not vim.opt.relativenumber:get() then
                return
            end
            vim.opt.relativenumber = vim.api.nvim_get_mode().mode ~= "i"
        end,
    }
)

vim.api.nvim_create_autocmd(
    { "BufLeave", "FocusLost", "InsertEnter", "WinLeave", "CmdlineEnter" },
    {
        group = augroup("toggle_relative_number"),
        callback = function(ev)
            vim.opt.relativenumber = false
            if ev.event == "CmdlineEnter" then
                vim.cmd("redraw")
            end
        end,
    }
)

vim.api.nvim_create_autocmd("FileType", {
    group = augroup("close_with_q"),
    pattern = { "help", "lspinfo", "man", "notify", "checkhealth", "query" },
    callback = function()
        vim.opt_local.buflisted = false
        vim.keymap.set("n", "q", "<Cmd>close<CR>", { buffer = 0 })
    end,
})
