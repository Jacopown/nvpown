local null_ls_ok, null_ls = pcall(require, "null-ls")
if not null_ls_ok then
	vim.notify("There was a problem while requiring null-ls plugin")
end

local mason_null_ls_ok, mason_null_ls = pcall(require, "mason-null-ls")
if not mason_null_ls_ok then
	vim.notify("There was a problem while requiring mason-null-ls plugin")
end

null_ls.setup({
	debug = true,
})
mason_null_ls.setup({
	ensure_installed = { "stylua" },
	automatic_setup = true,
})

mason_null_ls.setup_handlers()
