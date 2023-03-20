local nvim_tree_conf_ok, _ = pcall(require, "plugins-configs.nvim-tree")
if not nvim_tree_conf_ok then
	vim.notify("There was a problem while requiring nvim-tree configs")
end

local treesitter_conf_ok, _ = pcall(require, "plugins-configs.treesitter")
if not treesitter_conf_ok then
	vim.notify("There was a problem while requiring treesitter configs")
end

local autopairs_conf_ok, _ = pcall(require, "plugins-configs.autopairs")
if not autopairs_conf_ok then
	vim.notify("There was a problem while requiring autopairs configs")
end

local comment_conf_ok, _ = pcall(require, "plugins-configs.comment")
if not comment_conf_ok then
	vim.notify("There was a problem while requiring comment configs")
end

local bufferline_conf_ok, _ = pcall(require, "plugins-configs.bufferline")
if not bufferline_conf_ok then
	vim.notify("There was a problem while requiring bufferline configs")
end

local telescope_conf_ok, _ = pcall(require, "plugins-configs.telescope")
if not telescope_conf_ok then
	vim.notify("There was a problem while requiring telescope configs")
end

local alpha_conf_ok, _ = pcall(require, "plugins-configs.alpha")
if not alpha_conf_ok then
	vim.notify("There was a problem while requiring alpha configs")
end

local lualine_conf_ok, _ = pcall(require, "plugins-configs.lualine")
if not lualine_conf_ok then
  vim.notify("There was a problem while requiring lualine configs")
end

local gitsigns_conf_ok, _ = pcall(require, "plugins-configs.gitsigns")
if not gitsigns_conf_ok then
  vim.notify("There was a problem while requiring gitsigns configs")
end

local gitblame_conf_ok, _ = pcall(require, "plugins-configs.git-blame")
if not gitblame_conf_ok then
  vim.notify("There was a problem while requiring git-blame configs")
end

local toggleterm_conf_ok, _ = pcall(require, "plugins-configs.toggleterm")
if not toggleterm_conf_ok then
  vim.notify("There was a problem while requiring toggleterm configs")
end

local null_ls_conf_ok, _ = pcall(require, "plugins-configs.null-ls")
if not null_ls_conf_ok then
  vim.notify("There was a problem while requiring null-ls configs")
end
