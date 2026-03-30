local gh = require("custom.utils").github

vim.pack.add({
    gh("windwp/nvim-autopairs"),
    gh("kylechui/nvim-surround"),
    gh("cosmicbuffalo/eyeliner.nvim"),
})

-- autopairs
require("nvim-autopairs").setup()

-- surround
require("nvim-surround").setup()

-- eyeliner
require("eyeliner").setup({ dim = true })
