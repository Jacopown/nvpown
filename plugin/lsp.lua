vim.pack.add({
  'https://github.com/neovim/nvim-lspconfig',
  'https://github.com/mason-org/mason.nvim.git',
  'https://github.com/mason-org/mason-lspconfig.nvim.git'
})

local capabilities = require('blink.cmp').get_lsp_capabilities()
vim.lsp.config('*', {
    capabilities = capabilities,
})

require('mason').setup({
  ui = {
    icons = {
      package_installed = '✓',
      package_pending = '➜',
      package_uninstalled = '✗',
    },
  }
})

require('mason-lspconfig').setup({
  ensure_installed = {
    'basedpyright',
    'bashls',
    'clangd',
    'jdtls',
    'lua_ls',
    'rust_analyzer',
    'vtsls'
  },
})
