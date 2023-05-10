local lsp = require("lsp-zero").preset("recommended")

lsp.setup_nvim_cmp({
    preselect = 'none',
    completion = {completeopt = 'menu,menuone,noinsert,noselect'}
})

-- require("lspconfig").dartls.setup({
--     cmd = {"dart", "language-server", "--protocol=lsp"}
-- })

lsp.setup()

require("daze.config.cmp")
