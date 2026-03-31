return {
    "glacambre/firenvim",
    build = function()
        require("lazy").load({ plugins = { "firenvim" }, wait = true })
        vim.fn["firenvim#install"](0)
    end,
    cond = not not vim.g.started_by_firenvim,
    config = function()
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

        vim.opt.laststatus = 0
        vim.opt.cmdheight = 0
        vim.opt.signcolumn = "auto"
    end,
}
