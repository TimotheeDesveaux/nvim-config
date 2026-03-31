local gh = require("custom.utils").github

-- autopairs
vim.pack.add({ gh("windwp/nvim-autopairs") })

require("nvim-autopairs").setup()

-- surround
vim.pack.add({ gh("kylechui/nvim-surround") })

require("nvim-surround").setup()

-- eyeliner
vim.pack.add({ gh("cosmicbuffalo/eyeliner.nvim") })

require("eyeliner").setup({ dim = true })
