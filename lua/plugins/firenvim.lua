vim.g.firenvim_config = {
    globalSettings = {
        alt = "all",
    },
    localSettings = {
        [".*"] = {
            cmdline = "neovim",
            content = "text",
            priority = 0,
            selector = "textarea",
            takeover = "never",
        },
    },
}

vim.api.nvim_create_autocmd("UIEnter", {
    pattern = "*",
    callback = function()
        local chan_info = vim.api.nvim_get_chan_info(vim.v.event.chan)
        if chan_info.client and chan_info.client.name == "Firenvim" then
            vim.opt.laststatus = 0
        end
    end,
})
