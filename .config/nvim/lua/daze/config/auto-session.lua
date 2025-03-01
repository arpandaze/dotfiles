local auto_session = require("auto-session")

-- Setup auto-session with your existing configuration
auto_session.setup({
	suppressed_dirs = { "~/", "~/Projects", "~/Downloads", "/" },
	auto_restore = false,
	-- log_level = 'debug',
})

-- Create a custom command to open the previous session
vim.api.nvim_create_user_command("Prev", function()
	auto_session.RestoreSession()
end, {})

-- Create an alias for better discoverability
vim.api.nvim_create_user_command("PrevSession", function()
	auto_session.RestoreSession()
end, {})
