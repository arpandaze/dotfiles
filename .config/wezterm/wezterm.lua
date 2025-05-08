local wezterm = require("wezterm")

return {
	default_prog = { "/usr/bin/fish" },
	warn_about_missing_glyphs = false,
	harfbuzz_features = { "calt=0", "clig=0", "liga=0" },
	font = wezterm.font("Iosevka Nerd Font"),
	font_size = 10.5,
	font_rules = {
		{
			italic = true,
			intensity = "Normal",
			font = wezterm.font("Iosevka Nerd Font", { italic = true }),
		},
		{
			italic = true,
			intensity = "Bold",
			font = wezterm.font("Iosevka Nerd Font", { weight = "Bold", italic = true }),
		},
		{
			intensity = "Bold",
			font = wezterm.font("Iosevka Nerd Font", { weight = "Bold" }),
		},
	},
	color_scheme = "Builtin Solarized Dark", -- use this as a base and override below
	colors = {
		foreground = "#7f85a3",
		background = "#000000",
		cursor_bg = "#FFFFFF",
		cursor_fg = "#7f85a3",
		cursor_border = "#FFFFFF",
		selection_fg = "#1C1F24",
		selection_bg = "#BBC2CF",
		ansi = {
			"#444a73",
			"#ff5370",
			"#4fd6be",
			"#ffc777",
			"#3e68d7",
			"#fc7b7b",
			"#86e1fc",
			"#d1d0d0",
		},
		brights = {
			"#828bb8",
			"#ff98a4",
			"#c3e88d",
			"#ffc777",
			"#82aaff",
			"#ff966c",
			"#b4f9f8",
			"#5f8787",
		},
	},
	window_padding = {
		left = 6,
		right = 6,
		top = 6,
		bottom = 6,
	},
	-- window_decorations = "NONE",

	-- Hide the tab bar when there is only one tab
	hide_tab_bar_if_only_one_tab = true,

	-- Enable a more minimalist appearance
	enable_tab_bar = false,
	enable_scroll_bar = false,
	window_frame = {
		font = wezterm.font("Iosevka Nerd Font", { weight = "Regular" }),
	},
	window_background_opacity = 1.0,
	term = "xterm-256color",
	scrollback_lines = 5000,
	adjust_window_size_when_changing_font_size = false,
	keys = {
		{ key = "V", mods = "CTRL|SHIFT", action = wezterm.action({ PasteFrom = "Clipboard" }) },
		{ key = "C", mods = "CTRL|SHIFT", action = wezterm.action({ CopyTo = "Clipboard" }) },
		{ key = "Insert", mods = "SHIFT", action = wezterm.action({ PasteFrom = "PrimarySelection" }) },
		{ key = "L", mods = "CTRL", action = wezterm.action({ SendString = "\x0c" }) },
		{ key = "Enter", mods = "ALT", action = wezterm.action.DisableDefaultAssignment },
		{ key = "+", mods = "CTRL", action = wezterm.action.IncreaseFontSize },
		{ key = "-", mods = "CTRL", action = wezterm.action.DecreaseFontSize },
	},
	-- mouse_bindings = {
	--     { event = { Down = { streak = 1, button = 'Left' } },   mods = 'SHIFT', action = wezterm.action.SelectTextAtMouseCursor('Cell'), },
	--     { event = { Down = { streak = 1, button = 'Middle' } }, mods = 'SHIFT', action = wezterm.action.PasteFrom('PrimarySelection'), },
	--     { event = { Down = { streak = 2, button = 'Left' } },   mods = 'SHIFT', action = wezterm.action.SelectTextAtMouseCursor('Word'), },
	--     { event = { Down = { streak = 3, button = 'Left' } },   mods = 'SHIFT', action = wezterm.action.SelectTextAtMouseCursor('Line'), },
	--     { event = { Drag = { streak = 1, button = 'Left' } },   mods = 'SHIFT', action = wezterm.action.ExtendSelectionToMouseCursor('Cell'), },
	--     { event = { Drag = { streak = 2, button = 'Left' } },   mods = 'SHIFT', action = wezterm.action.ExtendSelectionToMouseCursor('Word'), },
	--     { event = { Drag = { streak = 3, button = 'Left' } },   mods = 'SHIFT', action = wezterm.action.ExtendSelectionToMouseCursor('Line'), },
	--     { event = { Up = { streak = 2, button = 'Left' } },     mods = 'SHIFT', action = wezterm.action.CompleteSelection('ClipboardAndPrimarySelection'), },
	--     { event = { Up = { streak = 3, button = 'Left' } },     mods = 'SHIFT', action = wezterm.action.CompleteSelection('ClipboardAndPrimarySelection'), },
	-- },
}
