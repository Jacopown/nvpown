local indentline_ok, indentline = pcall(require, 'indent_blankline')
if not indentline_ok then
	vim.notify("There was a problem while requiring indent_blankline plugin")
end

indentline.setup ({})
