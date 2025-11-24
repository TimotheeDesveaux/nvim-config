local function augroup(name, clear)
    clear = clear ~= false
    return vim.api.nvim_create_augroup("custom_" .. name, { clear = clear })
end

vim.filetype.add({
    extension = {
        h = "c",
        tex = "tex",
    },
})

vim.api.nvim_create_autocmd("TextYankPost", {
    group = augroup("highlight_yank"),
    callback = function()
        vim.hl.on_yank({ higroup = "Visual", on_visual = false })
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
        group = augroup("toggle_relative_number", false),
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
    pattern = { "help", "lspinfo", "man", "notify", "checkhealth", "query", "oil" },
    callback = function()
        vim.opt_local.buflisted = false
        vim.keymap.set("n", "q", "<Cmd>close<CR>", { buffer = 0 })
    end,
})
