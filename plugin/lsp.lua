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

-- return {
-- 		config = function(_, opts)
-- 			for server, config in pairs(opts.servers) do
-- 				local capabilities = require('blink.cmp').get_lsp_capabilities(config.capabilities)
-- 				capabilities.textDocument.foldingRange = {
-- 					dynamicRegistration = false,
-- 					lineFoldingOnly = true,
-- 				}
-- 				config.capabilities = capabilities
-- 				vim.lsp.config(server, config)
-- 			end
-- 		end,
--
-- 	{
-- 		'nvimtools/none-ls.nvim',
-- 		lazy = false,
-- 		dependencies = 'nvim-lua/plenary.nvim',
-- 		opts = function()
-- 			local null_ls = require('null-ls')
-- 			local opts = {
-- 				sources = {
-- 					null_ls.builtins.formatting.stylua,
-- 					null_ls.builtins.formatting.black,
-- 				},
-- 			}
-- 			return opts
-- 		end,
-- 	}
-- }
