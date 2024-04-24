local conform = require("conform")

conform.setup({
    format_on_save = {
      timeout_ms = 500,
      lsp_fallback = true,
    },
	formatters_by_ft = {
		lua = { "stylua" },

		-- Conform will run multiple formatters sequentially
		python = { "isort", "black" },

		-- Use a sub-list to run only the first available formatter
		javascript = { "prettier" },

		typescript = { "prettier" },

		typescriptreact = { "prettier" },

		javascriptreact = { "prettier" },

		css = { "prettier" },

		json = { "prettier" },

		rust = { "rustfmt" },

        dart = { "dart_format" },

        php = { "php-cs-fixer" },
	},
})
