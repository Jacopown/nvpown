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

lsputils.setup()

for _, server in ipairs(servers) do

	local opts = {
    on_attach = lsputils.on_attach,
    capabilities = lsputils.capabilities,
	}

	if server == "lua_ls" then
    local lua_ls_opts_ok, lua_ls_opts = pcall(require, "completion.settings.lua_ls")
    if not lua_ls_opts_ok then
      vim.notify("There was a problem while requiring lua_ls options")
    end
		opts = vim.tbl_deep_extend("force", lua_ls_opts, opts)
	end

	lspconfig[server].setup(opts)
end
