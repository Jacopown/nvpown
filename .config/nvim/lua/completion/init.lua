local mason_conf_ok, mason_conf = pcall(require, "completion.mason")
if not mason_conf_ok then
	vim.notify("There was a problem while requiring mason configs")
end

local lspconfig_conf_ok, lspconfig_conf = pcall(require, "completion.lspconfig")
if not lspconfig_conf_ok then
	vim.notify("There was a problem while requiring lspconfig configs")
end

local cmp_conf_ok, cmp_conf = pcall(require, "completion.cmp")
if not cmp_conf_ok then
	vim.notify("There was a problem while requiring cmp configs")
end
