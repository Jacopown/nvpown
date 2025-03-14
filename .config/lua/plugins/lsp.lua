return {
  {
    "williamboman/mason.nvim",
    opts = {
      ui = {
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗"
        }
      }
    }
  },
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = "williamboman/mason.nvim",
    opts = {
      automatic_installation = true,
    },
  },
  {
    "neovim/nvim-lspconfig",
    keys = {
      { '<leader>ff', function() vim.lsp.buf.format({ async = false }) end, mode = { 'n', 'v' } },
      { 'gc',         function() vim.lsp.buf.code_action() end,             'n' },
      { 'gD',         function() vim.lsp.buf.declaration() end,             'n' }, -- usually not implemented by by lsps
      { 'gd',         function() vim.lsp.buf.definition() end,              'n' },
      { '<S-k>',      function() vim.lsp.buf.hover() end,                   'n' },
      { 'gi',         function() vim.lsp.buf.implementation() end,          'n' },
      { 'gr',         function() vim.lsp.buf.references() end,              'n' },
      { 'gR',         function() vim.lsp.buf.rename() end,                  'n' },
      { 'gh',         function() vim.lsp.buf.signature_help() end,          'n' },
    },
    dependencies = 'williamboman/mason-lspconfig.nvim',

    opts = {
      servers = {
        lua_ls = {
          settings = {
            Lua = {
              hint = {
                enable = true,
                arrayIndex = "Disable",
              },
              runtime = {
                version = "LuaJIT",
              },
              workspace = {
                library = vim.api.nvim_get_runtime_file("", true),
              },
            }
          }
        },
        basedpyright = {
          settings = {
            basedpyright = {
              analysis = {
                -- autoSearchPaths = true,
                -- diagnosticMode = "openFilesOnly",
                -- useLibraryCodeForTypes = true
              }
            }
          }
        },
        jsonls = {}
      },
    },
    config = function(_, opts)
      for server, config in pairs(opts.servers) do
        config.capabilities = require('blink.cmp').get_lsp_capabilities(config.capabilities)
        require('lspconfig')[server].setup(config)
      end
    end
  },
}
