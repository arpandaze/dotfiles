local blankline = require("ibl")

local options = {
  scope = { enabled = false },
	exclude = {
		filetypes = {
			"dashboard",
		},
	},
}

blankline.setup(options)
