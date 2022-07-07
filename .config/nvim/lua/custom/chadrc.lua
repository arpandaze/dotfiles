-- This is an example chadrc file , its supposed to be placed in /lua/custom/

local M = {}

M.mappings = {}

-- make sure you maintain the structure of `core/default_config.lua` here,
-- example of changing theme:

M.ui = {
   theme = "onedark",
}

M.plugins = {
   status = {
      colorizer = true,
      dashboard = true,
      snippets = true,
   },
}

-- Install plugins
local userPlugins = require "custom.plugins" -- path to table

M.mappings.plugins = {
   comment = {
      toggle = "<leader>c", -- toggle comment (works on multiple lines)
   },
   nvimtree = {
      toggle = "<C-b>",
      focus = "<leader>p",
   }
}

M.plugins = {
   install = userPlugins,
}

-- M.setup = function (){
--   vim.g.diagnostic.config({
--     virtual_text = false,
--   })}

-- NOTE: we heavily suggest using Packer's lazy loading (with the 'event','cmd' fields)
-- see: https://github.com/wbthomason/packer.nvim
-- https://nvchad.github.io/config/walkthrough

return M
