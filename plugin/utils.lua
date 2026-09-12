vim.pack.add({
  'https://github.com/catgoose/nvim-colorizer.lua.git',
  'https://github.com/folke/which-key.nvim.git',
  'https://github.com/nvim-tree/nvim-web-devicons',
  'https://github.com/nvim-lualine/lualine.nvim.git',
  'https://github.com/stevearc/oil.nvim.git',
})

vim.keymap.set('n', '<leader>?', function() require('which-key').show({ global = false }) end, { desc = 'Buffer Local Keymaps (which-key)' })

require('lualine').setup()
require("oil").setup({
  view_options = {
    show_hidden = true,
  },
})
