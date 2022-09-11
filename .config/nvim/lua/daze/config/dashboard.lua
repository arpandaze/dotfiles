local home = os.getenv("HOME")
local dash = require("dashboard")

dash.custom_header = {
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
}
dash.custom_center = {
	{
		icon = "  ",
		desc = "Find  File                              ",
		action = "Telescope find_files",
		shortcut = "SPC f f",
	},
	{
		icon = "  ",
		desc = "Find  word                              ",
		action = "Telescope live_grep",
		shortcut = "SPC f w",
	},
	{
		icon = "  ",
		desc = "Recent session                          ",
		shortcut = "SPC s l",
		action = "SessionLoad",
	},
	{
		icon = "  ",
		desc = "Recently opened files                   ",
		action = "DashboardFindHistory",
		shortcut = "SPC f h",
	},
	{
		icon = "  ",
		desc = "Themes                                  ",
		action = "Telescope colorscheme",
		shortcut = "SPC t h",
	},
	{
		icon = "  ",
		desc = "Open Personal dotfiles                  ",
		action = "Telescope dotfiles path=" .. home .. ".config/nvim",
		shortcut = "SPC f d",
	},
}
