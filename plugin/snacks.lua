vim.pack.add({'https://github.com/folke/snacks.nvim.git'})
require('snacks').setup({
	dashboard = {},
	indent = {},
	zen = {},
	picker = {
		files = {
		  hidden = true,
		  ignored = true,
		  follow = true,
		},
	},
})

vim.keymap.set('n', '<leader>ff', function() Snacks.picker.files() end, { desc = 'Find Files' })
vim.keymap.set('n', '<leader>fw', function() Snacks.picker.grep() end, { desc = 'Find Word' })
vim.keymap.set('n', '<leader>fh', function() Snacks.picker.help() end, { desc = 'Help Pages' })
vim.keymap.set('n', '<leader>fd', function() Snacks.picker.diagnostics() end, { desc = 'Diagnostics' })
vim.keymap.set('n', '<leader>fD', function() Snacks.picker.diagnostics_buffer() end, { desc = 'Buffer Diagnostics' })
vim.keymap.set('n', 'gr', function() Snacks.picker.lsp_references() end, { desc = 'Find References' })
vim.keymap.set('n', '<leader>z', function() Snacks.zen() end, { desc = 'Toggle Zen Mode' })
vim.keymap.set('n', '<S-q>', function() Snacks.bufdelete() end, { desc = 'Delete Buffer' })
