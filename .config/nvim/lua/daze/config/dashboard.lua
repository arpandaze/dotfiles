local home = os.getenv("HOME")
require("dashboard").setup({
	theme = "doom",
	config = {
		header = {
			"",
			"",
			" ███╗   ██╗ ███████╗ ██████╗  ██╗   ██╗ ██╗ ███╗   ███╗",
			" ████╗  ██║ ██╔════╝██╔═══██╗ ██║   ██║ ██║ ████╗ ████║",
			" ██╔██╗ ██║ █████╗  ██║   ██║ ██║   ██║ ██║ ██╔████╔██║",
			" ██║╚██╗██║ ██╔══╝  ██║   ██║ ╚██╗ ██╔╝ ██║ ██║╚██╔╝██║",
			" ██║ ╚████║ ███████╗╚██████╔╝  ╚████╔╝  ██║ ██║ ╚═╝ ██║",
			" ╚═╝  ╚═══╝ ╚══════╝ ╚═════╝    ╚═══╝   ╚═╝ ╚═╝     ╚═╝",
			"",
			"",
		},
		center = {
			{
				icon = "  ",
				desc = "Find  File",
				action = "Telescope find_files",
				-- key = "f",
				key = "SPC f f",
			},
			{
				icon = "  ",
				desc = "Find  word",
				action = "Telescope live_grep",
				-- key = "f",
				key = "SPC f w",
			},
			{
				icon = "  ",
				desc = "Recent session",
				-- key = "s",
				key = "SPC s l",
				action = "SessionLoad",
			},
			{
				icon = "  ",
				desc = "Recently opened files",
				action = "DashboardFindHistory",
				-- key = "f",
				key = "SPC f h",
			},
			{
				icon = "  ",
				desc = "Themes",
				action = "Telescope colorscheme",
				-- key = "t",
				key = "SPC t h",
			},
			{
				icon = "  ",
				desc = "Open Personal dotfiles",
				action = "Telescope dotfiles path=" .. home .. ".config/nvim",
				-- key = "f",
				key = "SPC f d",
			},
		},
		footer = {},
	},
})
