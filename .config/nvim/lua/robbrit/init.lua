-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.opt.termguicolors = true
vim.opt.nu = true
vim.opt.smartindent = true
vim.opt.incsearch = true
vim.opt.colorcolumn = "100,120"
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2

vim.g.mapleader = " "

require("robbrit.lazy_init")

require('cmp').setup {
  sources = {
    { name = 'nvim_lsp' }
  }
}

require("mason").setup()
local capabilities = require('cmp_nvim_lsp').default_capabilities()

local lspconfig = require("lspconfig")

require("local")
