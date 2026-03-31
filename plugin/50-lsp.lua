local utils = require("custom.utils")
local gh = utils.github
local augroup = utils.augroup

-- lightbulb
vim.pack.add({ gh("kosayoda/nvim-lightbulb") })

require("nvim-lightbulb").setup({
    sign = { enabled = false },
    virtual_text = {
        enabled = true,
        text = "󰌵",
    },
    autocmd = { enabled = true },
})

-- fidget
vim.pack.add({ gh("j-hui/fidget.nvim") })

require("fidget").setup({})

-- lspconfig
vim.pack.add({ gh("neovim/nvim-lspconfig") })

require("custom.lsp.ui").setup()

vim.diagnostic.config({
    severity_sort = true,
    virtual_text = true,
})

vim.api.nvim_create_autocmd("LspAttach", {
    group = augroup("lsp"),
    callback = function(args)
        local client = assert(vim.lsp.get_client_by_id(args.data.client_id))
        require("custom.lsp.keymaps").on_attach(args.buf)
        require("custom.lsp.ui").on_attach(client, args.buf)
    end,
})

local servers = {
    lua_ls = {
        settings = {
            Lua = {
                runtime = { version = "LuaJIT" },
                workspace = { checkThirdParty = false },
                telemetry = { enable = false },
            },
        },
    },
    clangd = {},
    pyright = {},
    texlab = {},
    nil_ls = {},
    rust_analyzer = {},
    hls = {},
    vtsls = {},
    tailwindcss = {},
}

for server, config in pairs(servers) do
    vim.lsp.config(server, config)
    vim.lsp.enable(server)
end
