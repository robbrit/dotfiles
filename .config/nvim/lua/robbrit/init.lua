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

vim.cmd.colorscheme("tokyonight")
require('cmp').setup {
  sources = {
    { name = 'nvim_lsp' }
  }
}

require("mason").setup()
local capabilities = require('cmp_nvim_lsp').default_capabilities()

local lspconfig = require("lspconfig")
local telescope = require("telescope.builtin")
vim.keymap.set('n', '<leader>ff', telescope.find_files, { desc = "Telescope find file" })
vim.keymap.set('n', '<leader>fs', telescope.live_grep, { desc = "Telescope search string" })

local nvimtree = require("nvim-tree")
nvimtree.setup()
require("telescope").setup({
  pickers = {
    find_files = {
      hidden = true
    }
  }
})

local nvimtreeapi = require("nvim-tree.api")
vim.keymap.set('n', '<leader>tt', nvimtreeapi.tree.toggle, { desc = "Tree: Toggle" })
