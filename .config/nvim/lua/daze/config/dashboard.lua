local home = os.getenv("HOME")
require("dashboard").setup({
	theme = "doom",
	config = {
		header = {
			"",
			"",
			"",
			"",
			"",
			"",
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
			"",
			"",
			"",
			"",
		},
		center = {
			{
				icon = "  ",
				desc = "Find  File",
				action = "Telescope find_files",
				key = "SPC f f",
			},
			{
				icon = "  ",
				desc = "Find  word",
				action = "Telescope live_grep",
				key = "SPC f w",
			},
			{
				icon = "  ",
				desc = "Recent session",
				key = "SPC s l",
				action = "SessionLoad",
			},
			{
				icon = "  ",
				desc = "Recently opened files",
				action = "DashboardFindHistory",
				key = "SPC f h",
			},
			{
				icon = "  ",
				desc = "Themes",
				action = "Telescope colorscheme",
				key = "SPC t h",
			},
			{
				icon = "  ",
				desc = "Open Personal dotfiles",
				action = "Telescope dotfiles path=" .. home .. ".config/nvim",
				key = "SPC f d",
			},
		},
		footer = { "", "", "Loaded " .. require("dashboard.utils").get_packages_count() .. " packages" },
	},
})
