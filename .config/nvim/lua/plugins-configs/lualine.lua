local lualine_ok, lualine = pcall(require, 'lualine')
if not lualine_ok then
	vim.notify("There was a problem while requiring lualine plugin")
end

lualine.setup {
  options = {
    theme = 'nord',
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
    disabled_filetypes = { 'NvimTree' },
    always_divide_middle = true,
    globalstatus = true,
  },
  sections = {
    lualine_a = { 'mode' },
    lualine_b = { 'branch', 'diff', 'diagnostics' },
    lualine_c = { 'filename', 'lsp_progress' },
    lualine_x = { 'filetype'},
    lualine_y = { 'searchcount' },
    lualine_z = { 'location' }
  },
  extensions = {}
}
