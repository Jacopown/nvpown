return {
  {
    'VonHeikemen/lsp-zero.nvim',
    -- pin = true,
    dependencies = {
      'neovim/nvim-lspconfig',
      'kevinhwang91/nvim-ufo',
    },
    config = function()
      local lsp = require('lsp-zero').preset({})

      lsp.on_attach(function(_, bufnr)
        lsp.default_keymaps({buffer = bufnr})
      end)

      lsp.set_server_config({
        capabilities = {
          textDocument = {
            foldingRange = {
              dynamicRegistration = false,
              lineFoldingOnly = true
            }
          }
        }
      })

      require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())

      lsp.setup()
    end,
  },
  {
    'neovim/nvim-lspconfig',
    -- pin = true,
    dependencies = {
      'williamboman/mason.nvim',
      'williamboman/mason-lspconfig.nvim',
      'hrsh7th/nvim-cmp',
    },
  },
}
