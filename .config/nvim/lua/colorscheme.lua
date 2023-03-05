local colorscheme_ok, colorscheme = pcall(require, "nordic")
if not colorscheme_ok then
	vim.notify("There was a problem while requiring colorscheme plugin")
end

colorscheme.colorscheme({
  -- Underline style used for spelling
  -- Options: 'none', 'underline', 'undercurl'
  underline_option = 'none',
  -- Italics for certain keywords such as constructors, functions,
  -- labels and namespaces
  italic = true,

  -- Italic styled comments
  italic_comments = true,

  -- Minimal mode: different choice of colors for Tabs and StatusLine
  minimal_mode = false,

  -- Darker backgrounds for certain sidebars, popups, etc.
  -- Options: true, false, or a table of explicit names
  -- Supported: terminal, qf, vista_kind, packer, nvim-tree, telescope, whichkey
  alternate_backgrounds = true,

  -- Callback function to define custom color groups
  -- See 'lua/nordic/colors/example.lua' for example defitions
  custom_colors = function(c, s, cs)
    return {}
  end
})
