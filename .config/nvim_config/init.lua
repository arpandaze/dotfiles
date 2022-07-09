vim.api.nvim_set_keymap("n", ":", ";", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", ";", ":", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>e", ":lua vim.diagnostic.open_float()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>rn', ":lua vim.lsp.buf.rename()<CR>", { noremap = true, silent = true })
