-- Example plugins file!
-- (suggestion) -> lua/custom/plugins/init.lua or anywhere in custom dir

return {
  { "tpope/vim-surround"},
  { "sbdchd/neoformat" },
  { "tpope/vim-fugitive" },
  {'akinsho/flutter-tools.nvim', requires = 'nvim-lua/plenary.nvim'},
  {
      "williamboman/nvim-lsp-installer",
      config = function()
         local lsp_installer = require "nvim-lsp-installer"

         lsp_installer.on_server_ready(function(server)
            local opts = {}

            server:setup(opts)
            vim.cmd [[ do User LspAttachBuffers ]]
         end)
      end,
  },
}
