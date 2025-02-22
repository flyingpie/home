-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua

local o = vim.opt

vim.g.autoformat = false

o.clipboard = "unnamedplus"
o.conceallevel = 0
o.expandtab = false
o.fileencoding = "utf-8"
o.hlsearch = true
o.ignorecase = true
o.list = true
o.listchars = { eol = "↲", tab = "»-", trail = "·", extends = "x", precedes = ".", nbsp = "␣", space = "." }
o.mouse = "a"
o.fixeol = false
o.number = true
o.numberwidth = 4
o.relativenumber = true
o.scrolloff = 8
o.showmode = false
o.sidescrolloff = 8
o.signcolumn = "yes"
o.smartindent = false
o.smartcase = true
o.splitbelow = true
o.splitright = true
o.statuscolumn = "%s %l  %r "
o.swapfile = false
o.tabstop = 4
o.termguicolors = true
o.timeoutlen = 300
o.undofile = true
o.updatetime = 300
o.wrap = false

vim.cmd "set whichwrap+=<,>,[,],h,l"
vim.cmd [[set iskeyword+=-]]

