local o = vim.opt

vim.g.autoformat = false		-- Don't format on save
vim.g.snacks_animate = false	-- Disable animations

o.clipboard = "unnamedplus"
o.conceallevel = 0
o.expandtab = false
o.fileencoding = "utf-8"
o.fixeol = false
o.hlsearch = true
o.ignorecase = true
o.list = true
o.listchars = { eol = "↲", tab = "»-", trail = "·", extends = "x", precedes = ".", nbsp = "␣", space = "." }
o.mouse = "a"
o.number = true
o.numberwidth = 4
o.relativenumber = true
o.scroll = 15
o.scrolloff = 2
o.showmode = false
o.sidescrolloff = 8
o.signcolumn = "yes"
o.smartcase = true
o.smartindent = false
o.spell = false
o.spelllang = { "en", "nl" }
o.splitbelow = true
o.splitright = true
o.statuscolumn = "%s %l  %r "
o.swapfile = false
o.tabstop = 4
o.termguicolors = true
o.timeoutlen = 300
o.undofile = true
o.updatetime = 300
o.winborder = "rounded"
o.wrap = false

o.fillchars = {
	horiz = '━',
}

vim.cmd "set whichwrap+=<,>,[,],h,l"
vim.cmd [[set iskeyword+=-]]
