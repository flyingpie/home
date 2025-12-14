local kset = vim.keymap.set

kset("",	"<Space>",				"<Nop>")

kset("n",	"<A-z>",				":set wrap!<CR>")						-- Toggle line wrap

-- Remap delete/change to black hole register
kset("n",	"d",					'"_d')									-- Delete, normal mode
kset("n",	"c", 					'"_c')									-- Copy, normal mode
kset("v",	"d", 					'"_d')									-- Delete, visual mode
kset("v",	"c", 					'"_c')									-- Copy, visual mode

-- kset("n",	"<C-d>",				"<C-d>zz");								-- Half page up, and center cursor
-- kset("n",	"<C-u>",				"<C-u>zz");								-- Half page up, and center cursor
-- kset("n",	"n",					"nzzzv");								-- Half page up, and center cursor
-- kset("n",	"N",					"Nzzzv");								-- Half page up, and center cursor

-- Window split
kset("n",	"<leader>q",			"<C-w>q")								-- Unsplit
kset("n", 	"<leader>-",			function() vim.cmd("split") end)		-- Split horizontal
kset("n", 	"<leader>\\",			function() vim.cmd("vsplit") end)		-- Split vertical

-- Window navigation
kset("n",	"<C-h>",				"<C-w>h")								-- Move left
kset("n", 	"<C-j>", 				"<C-w>j")								-- Move down
kset("n", 	"<C-k>", 				"<C-w>k")								-- Move up
kset("n", 	"<C-l>", 				"<C-w>l")								-- Move right

-- Window resize
kset("n",	"<C-Up>",				":resize -4<CR>")
kset("n",	"<C-Down>",				":resize +4<CR>")
kset("n",	"<C-Left>",				":vertical resize -2<CR>")
kset("n",	"<C-Right>",			":vertical resize +2<CR>")

kset("n",	"<C-w>",				":bp<bar>sp<bar>bn<bar>bd<CR>")			-- Close tab, but not window

-- Find And Replace
kset("n",	"<leader>fh",			":GrugFar<CR>")

-- LSP
kset("n",	"<leader>.",			vim.lsp.buf.code_action)
kset("n",	"<F12>",				vim.lsp.buf.definition)
kset("n",	"<leader>r",			vim.lsp.buf.rename)

-- Outline
kset("n",	"<leader>o",			"<cmd>Outline!<CR>")

kset("n",	"<leader>te",			"<cmd>Dotnet testrunner<CR>",			{ desc = "Toggle .Net test runner" })
