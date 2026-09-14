vim.pack.add({
  'https://github.com/catgoose/nvim-colorizer.lua.git',
  'https://github.com/folke/which-key.nvim.git',
  'https://github.com/nvim-tree/nvim-web-devicons',
  'https://github.com/nvim-lualine/lualine.nvim.git',
  'https://github.com/stevearc/oil.nvim.git',
})

vim.keymap.set('n', '<leader>?', function() require('which-key').show({ global = false }) end, { desc = 'Buffer Local Keymaps (which-key)' })

require('lualine').setup({
  options = {
    component_separators = '',
    section_separators = { left = '', right = '' },
  },
  sections = {
    lualine_a = { 'mode' },
    lualine_b = {
      {
        'diagnostics',
        sources = {
          function()
            local count = vim.diagnostic.count and vim.diagnostic.count(0) or {}
            return {
              error = count[vim.diagnostic.severity.ERROR] or 0,
              warn = count[vim.diagnostic.severity.WARN] or 0,
              info = (count[vim.diagnostic.severity.INFO] or 0) + (count[vim.diagnostic.severity.HINT] or 0),
            }
          end,
        },
        sections = { 'error', 'warn', 'info' },
        symbols = {
          error = '󰅚 ',
          warn = '󰀪 ',
          info = '󰋽 ',
        },
        always_visible = function()
          return #vim.lsp.get_clients({ bufnr = 0 }) > 0
        end,
      },
    },
    lualine_c = { 'filename' },
    lualine_x = { 'filetype' },
    lualine_y = { 'branch', 'diff' },
    lualine_z = { 'location' },
  },
})
require("oil").setup({
  view_options = {
    show_hidden = true,
  },
})
