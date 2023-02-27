local nvimtree_ok, nvim_tree = pcall(require, "nvim-tree")
if not nvimtree_ok then
	vim.notify("There was a problem while requiring nvim-tree plugin")
end

nvim_tree.setup({
	update_focused_file = {
		enable = true,
		update_cwd = true,
	},
	view = {
		side = "right",
		mappings = {
			list = {
				{ key = "h", action = "edit", action_cb = edit_or_open },
				{ key = "l", action = "edit", action_cb = edit_or_open },
			},
		},
	},
  modified = {
        enable = true,
  },
	diagnostics = {
		enable = true,
	},
})
