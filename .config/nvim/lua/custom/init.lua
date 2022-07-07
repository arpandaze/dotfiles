-- Please check NvChad docs if you're totally new to nvchad + dont know lua!!
-- This is an example init file in /lua/custom/
-- this init.lua can load stuffs etc too so treat it like your ~/.config/nvim/

-- MAPPINGS
local map = require("core.utils").map

map("n", ":", ";")
map("n", ";", ":")
map("n", "<leader>d", ":bd<CR>")
map("n", "Y", "y$")
map("n", "gD", "<Cmd>lua vim.lsp.buf.declaration()<CR>")
map("n", "gd", "<Cmd>lua vim.lsp.buf.definition()<CR>")
map("n", "K", "<Cmd>lua vim.lsp.buf.hover()<CR>")
map("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>")
map("n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>")
map("n", "<space>wa", "<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>")
map("n", "<space>wr", "<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>")
map("n", "<space>wl", "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>")
map("n", "<space>D", "<cmd>lua vim.lsp.buf.type_definition()<CR>")
map("n", "<space>rn", "<cmd>lua vim.lsp.buf.rename()<CR>")
map("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>")
map("n", "<space>e", '<cmd>lua vim.diagnostic.open_float(0, { scope = "line", border = "single" })<CR>')
map("n", "[d", "<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>")
map("n", "]d", "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>")
map("n", "<space>q", "<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>")
map("n", "<space>fm", ":Neoformat<CR>")
map("n", "<space>a", "ggVG")
map("n", "<space>rr", ":LspRestart<CR>")
map("n", "ca", "<cmd>lua vim.lsp.buf.code_action()<CR>")
map("n", "fc", "<cmd>lua require('telescope').extensions.flutter.commands()<CR>")
map("x", "ca", "<cmd>lua vim.lsp.buf.range_code_action()<CR>")


require("flutter-tools").setup{}

require("telescope").load_extension("flutter")

function _G.statusLine()
  return vim.g.flutter_tools_decorations.app_version
end

vim.opt.statusline ='%!v:statusLine()'
