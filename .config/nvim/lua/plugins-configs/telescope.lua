local telescope_ok, telescope = pcall(require, "telescope")
if not telescope_ok then
	vim.notify("There was a problem while requiring telescope plugin")
end

telescope.load_extension('fzf')
