local cmp_nvim_lsp_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not cmp_nvim_lsp_ok then
	vim.notify("There was a problem while requiring cmp_nvim_lsp plugin")
end

local lspconfig_ok, lspconfig = pcall(require, "lspconfig")
if not lspconfig_ok then
	vim.notify("There was a problem while requiring lspconfig plugin")
end

local capabilities = cmp_nvim_lsp.default_capabilities()

-- Enable some language servers with the additional completion capabilities offered by nvim-cmp
local servers = { 'lua_ls', 'vimls' }
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    -- on_attach = my_custom_on_attach,
    capabilities = capabilities,
  }
end
