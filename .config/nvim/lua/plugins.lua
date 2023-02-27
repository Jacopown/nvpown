-- Automatically install packer
local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so we don't error out on first use
local packer_ok, packer = pcall(require, "packer")
if not packer_ok then
	vim.notify("There was a problem while requiring packer")
end

-- Have packer use a popup window
packer.init({
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "single", border = "rounded" })
		end,
	},
})

-- Install your plugins here
return packer.startup(function(use)
  use { 'wbthomason/packer.nvim', commit = '1d0cf98a561f7fd654c970c49f917d74fafe1530' } -- Have packer manage itself
  use { 'nvim-lua/plenary.nvim', commit = '253d34830709d690f013daf2853a9d21ad7accab' } -- Requirement for Telescope
  use { 'nvim-tree/nvim-web-devicons', commit = '4709a504d2cd2680fb511675e64ef2790d491d36' }  -- Icons

  use { 'windwp/nvim-autopairs', commit = '6a5faeabdbcc86cfbf1561ae430a451a72126e81' }

  use { 'williamboman/mason.nvim', commit = '5b9fd3822d686092c7ee08adfcbd2c764def22c5' } -- LSP Installer
  use { 'williamboman/mason-lspconfig.nvim', -- Filling the gap between lspconfig and mason
    requires = { 'williamboman/mason.nvim' },
    commit = '93e58e100f37ef4fb0f897deeed20599dae9d128' }
  use { 'neovim/nvim-lspconfig', commit = '91998cef4b1ae3a624901d0f9c894409db24e760' } -- Configurations for Nvim LSP
  use { 'hrsh7th/cmp-nvim-lsp', commit = '0e6b2ed705ddcff9738ec4ea838141654f12eeef' }-- cmp extension for lsp support 
  use { 'hrsh7th/nvim-cmp', commit = 'ba7a53478d0726683d1597ad1e814695033dcb4b' } -- Completion plugin
  use { 'L3MON4D3/LuaSnip', commit = 'd33cf7de14eea209b8ed4a7edaed72f0b8cedb30' } --snippets
  use { 'saadparwaiz1/cmp_luasnip', --snippets source for cmp using LuaSnip 
    requiers = { 'L3MON4D3/LuaSnip' },
    commit = '18095520391186d634a0045dacaa346291096566' }
  use { "rafamadriz/friendly-snippets", commit = '6fa50a94ba5378bb73013a6e163376d8e69bd8a5' }

  use { "kyazdani42/nvim-tree.lua", -- File explorer
    requires = { 'nvim-tree/nvim-web-devicons' },
    commit = '9c97e6449b0b0269bd44e1fd4857184dfa57bb4c' } 

  use { 'nvim-treesitter/nvim-treesitter',
    run = function()
      local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
      ts_update()
    end,
    commit = 'c9d7f9c9207b6fe53f58e0a3ef2e5227c37d9004' }

  -- Colorschemes
  use { 'andersevenrud/nordic.nvim', 
    requires = { 'nvim-treesitter/nvim-treesitter' },
    commit = 'cd552784eeeae61644fec60f6cc52c267dbddc73' }
  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)
