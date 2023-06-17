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

      lsp.format_on_save({
        format_opts = {
          async = false,
          timeout_ms = 10000,
        },
        servers = {
          ['lua_ls'] = {'lua'},
          -- if you have a working setup with null-ls
          -- you can specify filetypes it can format.
          -- ['null-ls'] = {'javascript', 'typescript'},
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
