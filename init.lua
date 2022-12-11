vim.cmd("source ~/.config/nvim/lua/vim/run-python.vim")
vim.cmd("source ~/.config/nvim/lua/vim/vim-core.vim")
require("core.set")

require("plugin.install")
require("plugin.setup.tokyonight") -- COLORSCHEME
require("plugin.setup.lualine") -- COLOR BAR
require("plugin.setup.telescope") -- FUZZY FINDING
require("plugin.setup.nvim-tree") -- FILE EXPLORER
require("plugin.setup.autopairs") -- AUTO PAIRS
require("plugin.setup.indent-blankline") -- SHOW INDENTATION
require("plugin.setup.cmp_luasnip_lspkind") --
require("plugin.setup.treesitter") -- SYNTAX HIGHLIGHTING
require("plugin.setup.mason") -- SYNTAX HIGHLIGHTING
require("plugin.setup.lspconfig") -- SYNTAX HIGHLIGHTING
require("plugin.setup.lspsaga") -- SYNTAX HIGHLIGHTING
require("plugin.setup.null-ls") -- SYNTAX HIGHLIGHTING

require("core.map")
