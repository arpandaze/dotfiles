local M = {}

function M.CloseBuffer()
	local curBuf = vim.fn.bufnr("%")
	local curTab = vim.fn.tabpagenr()
	vim.cmd("bnext")

	-- If in last buffer, create empty buffer
	if curBuf == vim.fn.bufnr("%") then
		vim.cmd("enew")
	end

	-- Loop through tabs
	for i = 1, vim.fn.tabpagenr("$") do
		-- Go to tab (is there a way with inactive tabs?)
		vim.cmd("tabnext " .. i)
		-- Store active window nr to restore later
		local curWin = vim.fn.winnr()
		-- Loop through windows pointing to buffer
		local winnr = vim.fn.bufwinnr(curBuf)
		while winnr >= 0 do
			-- Go to window and switch to next buffer
			vim.cmd(winnr .. "wincmd w | bnext")
			-- Restore active window
			vim.cmd(curWin .. "wincmd w")
			winnr = vim.fn.bufwinnr(curBuf)
		end
	end

	-- Close buffer, restore active tab
	vim.cmd("bd " .. curBuf)
	vim.cmd("tabnext " .. curTab)
end

return M
