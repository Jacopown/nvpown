local settings_ok, _ = pcall(require, "settings")
if not settings_ok then
	vim.notify("There was a problem while requiring settings.lua")
end

local keymaps_ok, _ = pcall(require, "keymaps")
if not keymaps_ok then
	vim.notify("There was a problem while requiring keymaps.lua")
end

local plugins_ok, _ = pcall(require, "plugins")
if not plugins_ok then
	vim.notify("There was a problem while requiring plugins.lua")
end

local colorscheme_ok, _ = pcall(require, "colorscheme")
if not colorscheme_ok then
	vim.notify("There was a problem while requiring colorscheme.lua")
end

local plugins_conf_ok, _ = pcall(require, "plugins-configs")
if not plugins_conf_ok then
	vim.notify("There was a problem while requiring plugins config folder")
end

local cmp_folder_ok, _ = pcall(require, "completion")
if not cmp_folder_ok then
	vim.notify("There was a problem while requiring cmp folder")
end
