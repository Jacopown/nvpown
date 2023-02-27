local mason_lspconfig_ok, mason_lspconfig = pcall(require, "mason-lspconfig")
if not mason_lspconfig_ok then
	vim.notify("There was a problem while requiring mason-lspconfig plugin")
end

mason_lspconfig.setup {
    ensure_installed = { 'lua_ls', 'vimls' },
}
