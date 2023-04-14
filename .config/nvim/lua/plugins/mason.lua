return {
  {
    'williamboman/mason.nvim',
    -- pin = ture,
    build = ':MasonUpdate',  
    opt = {
      ui = {
        border = "rounded",
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗"
        }
      },
    },
    config = function(_, opts)
      require('mason').setup(opts)
    end,
  },
  {
    'williamboman/mason-lspconfig.nvim',
    -- pin = true,
    opts = {
      ensure_installed = { 'lua_ls', 'vimls', 'html', 'cssls', 'cssmodules_ls', 'jsonls', 'tsserver' },
    },
  },
}
