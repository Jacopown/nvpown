local keymaps_ok, _ = pcall(require, "keymaps")
if not keymaps_ok then
	vim.notify("There was a problem while requiring keymaps.lua")
end

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup("plugins")

vim.cmd[[colorscheme nordfox]]

local settings_ok, _ = pcall(require, "settings")
if not settings_ok then
	vim.notify("There was a problem while requiring settings.lua")
end

local autocommands_ok, _ = pcall(require, "autocommands")
if not autocommands_ok then
	vim.notify("There was a problem while requiring autocommands.lua")
end

-- local plugins_ok, _ = pcall(require, "plugins")
-- if not plugins_ok then
--	vim.notify("There was a problem while requiring plugins.lua")
-- end

-- local plugins_conf_ok, _ = pcall(require, "plugins-configs")
-- if not plugins_conf_ok then
--	vim.notify("There was a problem while requiring plugins config folder")
-- end

-- local cmp_folder_ok, _ = pcall(require, "completion")
-- if not cmp_folder_ok then
--	vim.notify("There was a problem while requiring cmp folder")
-- end
