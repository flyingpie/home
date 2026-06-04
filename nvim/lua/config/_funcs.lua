local M = {}

-- Close the current buffer (but not the window containing said buffer).
-- Basically the "CTRL+W" functionality of most editors and browsers).
M.close_buffer = function()
	local current_buf = vim.api.nvim_get_current_buf()

	-- If the current buffer is modified, refuse to close it.
	-- Use :bd! behavior only if you actually want to lose changes like a maniac.
	if vim.bo[current_buf].modified then
		vim.notify("Buffer has unsaved changes", vim.log.levels.WARN)
		return
	end

	local alternate_buf = vim.fn.bufnr("#")

	if
		alternate_buf > 0
		and alternate_buf ~= current_buf
		and vim.api.nvim_buf_is_valid(alternate_buf)
		and vim.bo[alternate_buf].buflisted
	then
		vim.api.nvim_set_current_buf(alternate_buf)
	else
		vim.cmd("enew")
	end

	local ok, err = pcall(vim.api.nvim_buf_delete, current_buf, {
		force = false,
	})

	if not ok then
		vim.notify("Could not close buffer: " .. err, vim.log.levels.WARN)
	end
end

M.move_line_down = function()
	local n = vim.v.count > 0 and vim.v.count or vim.wo.scroll
	vim.cmd("normal! " .. n .. "j")
end

M.move_line_up = function()
	local n = vim.v.count > 0 and vim.v.count or vim.wo.scroll
	vim.cmd("normal! " .. n .. "k")
end

M.toggle_diffview = function()
	if require("diffview.lib").get_current_view() then
		vim.cmd("DiffviewClose")
	else
		vim.cmd("DiffviewOpen")
	end
end

M.toggle_outline = function()
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
end

M.send_to_quicklist = function()
	Snacks.picker.actions.qflist_all(Snacks.picker())
end

M.on_scroll = function()
	local height = vim.api.nvim_win_get_height(0)

	-- scroll must be at least 1 and should not exceed the window height
	vim.opt_local.scroll = math.max(1, math.min(15, height - 1))
end

return M
