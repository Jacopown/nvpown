local treesitter_ok, treesitter = pcall(require, "nvim-treesitter.configs")
if not treesitter_ok then
	vim.notify("There was a problem while requiring treesitter plugin")
end

treesitter.setup({
	ensure_installed = "", -- one of "all" or a list of languages
  auto_install = true,
	ignore_install = { "" }, -- List of parsers to ignore installing
	highlight = {
		enable = true, -- false will disable the whole extension
		disable = { "" }, -- list of language that will be disabled
	},
	indent = {
    enable = true,
    disable = { "" }
  },
  rainbow = {
    enable = true,
  },
  autotag = {
      enable = true,
  }
})
