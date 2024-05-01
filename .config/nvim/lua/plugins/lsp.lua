local icons = require('icons')
return {
  {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v3.x',
    lazy = true,
    config = true,
  },

  {
    'williamboman/mason.nvim',
    lazy = false,
    -- pin = ture,
    build = ':MasonUpdate',
    opts = {
      ui = {
        border = "rounded",
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗"
        }
      },
    },
  },

  {
    'neovim/nvim-lspconfig',
    cmd = {'LspInfo', 'LspInstall', 'LspStart'},
    event = {'BufReadPre', 'BufNewFile'},
    config = function()
      local lsp_zero = require('lsp-zero')
      lsp_zero.extend_lspconfig()
      lsp_zero.on_attach(function(client, bufnr)
        lsp_zero.default_keymaps({buffer = bufnr})
      end)
      lsp_zero.set_sign_icons({
        error = icons.DiagnosticError,
        warn = icons.DiagnosticWarn,
        hint = icons.DiagnosticHint,
        info = icons.DiagnosticInfo,
      })
      lsp_zero.set_server_config({
        capabilities = {
          textDocument = {
            foldingRange = {
              dynamicRegistration = false,
              lineFoldingOnly = true
            }
          }
        }
      })
    end
  },

  {
    'williamboman/mason-lspconfig.nvim',
    requires = {
      'williamboman/mason.nvim',
      'neovim/nvim-lspconfig',
    },
    opts = {
      ensure_installed = { 'lua_ls', 'jdtls'  },
      handlers = { require('lsp-zero').default_setup },
    },
  }
}
