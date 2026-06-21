-- stylua: ignore start
local funcs = require("config._funcs")

local kset = vim.keymap.set

-- Unmap <Space> so we can use it as a leader
kset("",	"<Space>",				"<Nop>")

kset("n",	"<A-z>",				"<cmd>set wrap!<CR>",						{ desc = "Toggle Line Wrap" })
kset("n",	",",					"<cmd>m -2<CR>",							{ desc = "Move Line Up" })
kset("n",	"m",					"<cmd>m +1<CR>",							{ desc = "Move Line Down" })

-- Remap delete/change to black hole register
kset("v",	"c", 					'"_c',										{ desc = "Change Without Yank" })
kset("v",	"d",					'"_d',										{ desc = "Delete Without Yank" })
kset("x",	"<leader>p",			'"_dP',										{ desc = "Paste Without Yank" })

kset("n",	"<C-d>",				funcs.move_line_down,						{ desc = "Move Down (Prefer No Scrolling)" })
kset("n",	"<C-u>",				funcs.move_line_up,							{ desc = "Move Up (Prefer No Scrolling)" })

-- kset("n",	"<C-w>",				funcs.close_buffer,							{ desc = "Close Buffer" })
kset("n",	"<C-w>",				":bp<bar>sp<bar>bn<bar>bd<CR>",				{ desc = "Close Buffer" })
kset("n",	"<leader>q",			"<C-w>q",									{ desc = "Close Window" })

-- Window split
kset("n", 	"<leader>-",			"<cmd>split<CR>",							{ desc = "Split Horizontal" })
kset("n", 	"<leader>\\",			"<cmd>vsplit<CR>",							{ desc = "Split Vertical" })

-- Window navigation
kset("n", 	"<C-j>", 				"<C-w>j",									{ desc = "Move To Down Window" })
kset("n", 	"<C-k>", 				"<C-w>k",									{ desc = "Move To Up Window" })
kset("n",	"<C-h>",				"<C-w>h",									{ desc = "Move To Left Window" })
kset("n", 	"<C-l>", 				"<C-w>l",									{ desc = "Move To Right Window" })

-- Window resize
kset("n",	"<C-Up>",				"<cmd>resize -4<CR>",						{ desc = "Shrink Window Horizontally" })
kset("n",	"<C-Down>",				"<cmd>resize +4<CR>",						{ desc = "Expand Window Horizontally" })
kset("n",	"<C-Left>",				"<cmd>vertical resize -2<CR>",				{ desc = "Shrink Window Vertically" })
kset("n",	"<C-Right>",			"<cmd>vertical resize +2<CR>",				{ desc = "Expand Window Vertically" })

-- Find And Replace
kset("n",	"<leader>fh",			"<cmd>GrugFar<CR>",							{ desc = "Open GrugFar" })

--------------------------------
-- LSP
--------------------------------
kset("n",	"<leader>.",			vim.lsp.buf.code_action,					{ desc = "Code Actions" })
kset("n",	"<leader>r",			vim.lsp.buf.rename,							{ desc = "Rename" })
kset("n",	"<C-Space>",			vim.lsp.buf.hover,							{ desc = "Show LSP info" })

--------------------------------
-- DotNet
--------------------------------

kset("n",	"<F6>",					"<cmd>Dotnet build solution quickfix<CR>",	{ desc = ".Net - Build Solution" })
kset("n",	"<leader>te",			"<cmd>Dotnet testrunner<CR>",				{ desc = ".Net - Toggle Test Runner" })

-- kset("n",	"<leader>tr",			function() require("neotest").run.run() end,						{ desc = "Run nearest test" })
-- kset("n",	"<leader>td",			function() require("neotest").run.run({strategy = "dap"}) end,		{ desc = "Debug the nearest test" })
-- kset("n",	"<leader>tf",			function() require("neotest").run.run(vim.fn.expand("%")) end,		{ desc = "Run current file" })
--
-- kset("n",	"<leader>te",			function() require("neotest").summary.toggle() end,		{ desc = "Toggle test explorer" })
-- kset("n",	"<leader>to",			function() require("neotest").output.open() end,		{ desc = "Toggle test explorer" })

--------------------------------
-- Misc
--------------------------------

kset("n",	"<leader>do",			funcs.toggle_diffview,						{ desc = "Toggle Diff View" })
kset("n",	"<leader>o",			funcs.toggle_outline,						{ desc = "Toggle Between Minimap And Outline" })
kset("i",	"<C-l>",				funcs.send_to_quicklist,					{ desc = "Send FZF Items To Quicklist" })
