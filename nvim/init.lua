-- bootstrap lazy.nvim, LazyVim and your plugins
--require("config.keymaps")

vim.g.mapleader = " "
vim.g.maplocalleader = " "

require("config.lazy")

vim.o.termguicolors = true
--vim.cmd'colorscheme yourfavcolorscheme'

