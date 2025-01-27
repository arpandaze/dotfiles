local lsp = require("lsp-zero").preset("recommended")

-- -- Enable inlay hints
-- vim.api.nvim_create_autocmd("LspAttach", {
--     group = vim.api.nvim_create_augroup("UserLspConfig", {}),
--     callback = function(args)
--         local client = vim.lsp.get_client_by_id(args.data.client_id)
--         if client.server_capabilities.inlayHintProvider then
--             vim.lsp.inlay_hint.enable(true, { args.buf })
--         end
--     end,
-- })

lsp.setup_nvim_cmp({
	preselect = "none",
	completion = { completeopt = "menu,menuone,noinsert,noselect" },
})

require("lspconfig").dartls.setup({
	cmd = { "dart", "language-server", "--protocol=lsp" },
})

require("lspconfig").ts_ls.setup({
	cmd = vim.lsp.rpc.connect("127.0.0.1", 27632),
	filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "typescript.tsx" },
	settings = {
		lspMux = {
			version = "1",
			method = "connect",
			server = "typescript-language-server",
		},
	},
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
		inlayHints = {
			enable = true,
			showParameterNames = true,
			parameterHintsPrefix = "<- ",
			otherHintsPrefix = "=> ",
		},
		},
	},
})

lsp.setup()

require("daze.config.cmp")
