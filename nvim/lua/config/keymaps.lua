-- stylua: ignore start

local kset = vim.keymap.set

kset("",	"<Space>",				"<Nop>")

kset("n",	"<A-z>",				":set wrap!<CR>")						-- Toggle line wrap

-- Remap delete/change to black hole register
kset("n",	"d",					'"_d')									-- Delete, normal mode
kset("n",	"c", 					'"_c')									-- Copy, normal mode
kset("v",	"d", 					'"_d')									-- Delete, visual mode
kset("v",	"c", 					'"_c')									-- Copy, visual mode
kset("n",	"<leader>p",			'"_dP')									-- Paste without putting selected stuff in register
kset("v",	"<leader>p",			'"_dP')									-- Paste without putting selected stuff in register

-- TODO: Currently disabled because it doesn't play nice with smooth scroll
-- kset("n",	"<C-d>",				"<C-d>zz");							-- Half page up, and center cursor
-- kset("n",	"<C-u>",				"<C-u>zz");							-- Half page up, and center cursor
-- kset("n",	"n",					"nzzzv");							-- Half page up, and center cursor
-- kset("n",	"N",					"Nzzzv");							-- Half page up, and center cursor

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
-- kset("n",	"<C-w>",				function() Snacks.bufdelete() end)			-- Close tab, but not window

-- Find And Replace
kset("n",	"<leader>fh",			":GrugFar<CR>")

-- Diffview
kset("n",	"<leader>do",			":DiffviewOpen<CR>",					{ desc = "Open diff view" })

-- LSP
kset("n",	"<leader>.",			vim.lsp.buf.code_action,				{ desc = "Code action" })				-- Bring up actions like namespace import and diagnostic fix
kset("n",	"<F12>",				vim.lsp.buf.definition,					{ desc = "Go to definition" })					-- Go to definition (just get used to gd already)
kset("n",	"<leader>r",			vim.lsp.buf.rename,						{ desc = "Rename" })						-- Rename
kset("n",	"<C-Space>",			vim.lsp.buf.hover)						-- Rename

-- Outline
kset("n",	"<leader>o",			function()
	local outline = require("outline")
	local minimap = require("mini.map")

	-- If the outline is open, close it, and open the minimap
	if outline.is_open() then
		outline.close()
		minimap.open()
	-- Vice-versa
	else
		outline.open()
		minimap.close()
	end
	end)

kset("n",	"<leader>te",			"<cmd>Dotnet testrunner<CR>",			{ desc = "Toggle .Net test runner" })

kset("i",	"<C-l>",				function() Snacks.picker.actions.qflist_all(Snacks.picker()) end)

kset("n",	"<F6>",					":Dotnet build solution quickfix<CR>",	{ desc = ".Net - Build Solution" })
