-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.opt.termguicolors = true
vim.opt.nu = true
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.incsearch = true

vim.g.mapleader = " "

require("robbrit.lazy_init")

vim.cmd.colorscheme("tokyonight")

require("mason").setup()

local telescope = require("telescope.builtin")
vim.keymap.set('n', '<leader>fg', telescope.live_grep, { desc = "Telescope live grep" })

local nvimtree = require("nvim-tree")
nvimtree.setup()

local nvimtreeapi = require("nvim-tree.api")
vim.keymap.set('n', '<leader>tt', nvimtreeapi.tree.toggle, { desc = "Tree: Toggle" })
