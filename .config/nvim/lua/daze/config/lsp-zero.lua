local lsp = require("lsp-zero").preset("recommended")

lsp.setup_nvim_cmp({
	preselect = "none",
	completion = { completeopt = "menu,menuone,noinsert,noselect" },
})

require("lspconfig").dartls.setup({
	cmd = { "dart", "language-server", "--protocol=lsp" },
})

require("lspconfig").rust_analyzer.setup({
	cmd = vim.lsp.rpc.connect("127.0.0.1", 27631),
	settings = {
		["rust-analyzer"] = {
			lspMux = {
				version = "1",
				method = "connect",
				server = "rust-analyzer",
			},
		},
	},
})

lsp.setup()

-- vim.lsp.inlay_hint.enable(0, true)

require("daze.config.cmp")
