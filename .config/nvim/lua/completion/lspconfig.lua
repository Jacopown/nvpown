local mason_lspconfig_ok, mason_lspconfig = pcall(require, "mason-lspconfig")
if not mason_lspconfig_ok then
	vim.notify("There was a problem while requiring mason-lspconfig plugin")
end

local lspconfig_ok, lspconfig = pcall(require, "lspconfig")
if not lspconfig_ok then
	vim.notify("There was a problem while requiring lspconfig plugin")
end

local lsputils_ok, lsputils = pcall(require, "completion.lsputils")
if not lsputils_ok then
	vim.notify("There was a problem while requiring lsputils")
end

local servers = { 'lua_ls', 'vimls' }

mason_lspconfig.setup {
    ensure_installed = servers,
}

-- Enable some language servers with the additional completion capabilities offered by nvim-cmp
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = lsputils.on_attach,
    capabilities = lsputils.capabilities,
  }
end
