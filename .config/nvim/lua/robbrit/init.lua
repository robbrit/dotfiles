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

vim.keymap.set('n', '<leader>w', ":w<cr>", { desc = "Save file" })
vim.keymap.set('n', '<leader>q', ":q<cr>", { desc = "Close file" })

require("robbrit.lazy_init")

require('cmp').setup {
  sources = {
    { name = 'nvim_lsp' }
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
  }),
}

require("mason").setup()
local capabilities = require('cmp_nvim_lsp').default_capabilities()

local lspconfig = require("lspconfig")

lspconfig.gopls.setup({
  settings = {
    gopls = {
      staticcheck = true,
      gofumpt = true,
    },
  },
})
lspconfig.ts_ls.setup({
  capabilities = capabilities
})
lspconfig.eslint.setup({
  capabilities = capabilities
})

vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*.go",
  callback = function()
    local params = vim.lsp.util.make_range_params()
    params.context = {only = {"source.organizeImports"}}
    -- buf_request_sync defaults to a 1000ms timeout. Depending on your
    -- machine and codebase, you may want longer. Add an additional
    -- argument after params if you find that you have to write the file
    -- twice for changes to be saved.
    -- E.g., vim.lsp.buf_request_sync(0, "textDocument/codeAction", params, 3000)
    local result = vim.lsp.buf_request_sync(0, "textDocument/codeAction", params)
    for cid, res in pairs(result or {}) do
      for _, r in pairs(res.result or {}) do
        if r.edit then
          local enc = (vim.lsp.get_client_by_id(cid) or {}).offset_encoding or "utf-16"
          vim.lsp.util.apply_workspace_edit(r.edit, enc)
        end
      end
    end
    vim.lsp.buf.format({async = false})
  end
})

local telescope = require("telescope.builtin")
vim.keymap.set('n', '<leader>ff', telescope.find_files, { desc = "Telescope find file" })
vim.keymap.set('n', '<leader>fs', telescope.live_grep, { desc = "Telescope search string" })

local ts_actions = require("telescope.actions")
require("telescope").setup({
  pickers = {
    find_files = {
      hidden = true
    }
  },
  defaults = {
    file_ignore_patterns = { "node_modules", ".git" },
    mappings = {
      -- I prefer to open things in a new tab.
      n = {
        ["<CR>"] = ts_actions.select_tab,
      },
      i = {
        ["<CR>"] = ts_actions.select_tab,
      },
    },
  },
})

require("local")
