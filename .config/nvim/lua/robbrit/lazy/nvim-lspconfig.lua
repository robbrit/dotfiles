return {
   {
      "neovim/nvim-lspconfig",
      lazy = false,
      opts = {
         servers = {
            gopls = {
               settings = {
                  gopls = {
                     gofumpt = true,
                     codelenses = {
                        gc_details = false,
                        generate = true,
                        regenerate_cgo = true,
                        run_govulncheck = true,
                        test = true,
                        tidy = true,
                        upgrade_depphpactorendency = true,
                        vendor = true,
                     },
                     hints = {
                        assignVariableTypes = true,
                        compositeLiteralFields = true,
                        compositeLiteralTypes = true,
                        constantValues = true,
                        functionTypeParameters = true,
                        parameterNames = true,
                        rangeVariableTypes = true,
                     },
                     analyses = {
                        fieldalignment = true,
                        nilness = true,
                        unusedparams = true,
                        unusedwrite = true,
                        useany = true,
                     },
                     usePlaceholders = true,
                     completeUnimported = true,
                     staticcheck = true,
                     directoryFilters = { "-.git", "-.vscode", "-.idea", "-.vscode-test", "-node_modules" },
                     semanticTokens = true,
                  },
               },
            },
         },
         setup = {
            ---@diagnostic disable-next-line: unused-local
            gopls = function(_, opts)
               -- workaround for gopls not supporting semanticTokensProvider
               -- https://github.com/golang/go/issues/54531#issuecomment-1464982242
               vim.lsp.on_attach(function(client, _)
                  if not client.server_capabilities.semanticTokensProvider then
                     local semantic = client.config.capabilities.textDocument.semanticTokens
                     client.server_capabilities.semanticTokensProvider = {
                        full = true,
                        legend = {
                           tokenTypes = semantic.tokenTypes,
                           tokenModifiers = semantic.tokenModifiers,
                        },
                        range = true,
                     }
                  end
               end, "gopls")
               -- end workaround
            end,
         },
      },
      config = function()
         local lspconfig = require("lspconfig")
         lspconfig.intelephense.setup({
            init_options = {
               clearCache = true,
            },
            settings = {
               intelephense = {
                  files = {
                     maxSize = 5000000,
                  },
               },
            },
         })
         local ok, mason_registry = pcall(require, "mason-registry")
         if not ok then
            vim.notify("mason-registry could not be loaded")
            return
         end

         lspconfig.gopls.setup({})
      end,
   },
}
