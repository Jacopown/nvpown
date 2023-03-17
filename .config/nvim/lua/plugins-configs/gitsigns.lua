local gitsigns_ok, gitsigns = pcall(require, 'gitsigns')
if not gitsigns_ok then
	vim.notify("There was a problem while requiring gitsigns plugin")
end

gitsigns.setup()
