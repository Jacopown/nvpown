local comment_ok, comment = pcall(require, 'Comment')
if not comment_ok then
	vim.notify("There was a problem while requiring comment plugin")
end

comment.setup({})

