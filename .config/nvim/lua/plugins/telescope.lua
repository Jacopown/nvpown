return {
  {
    'nvim-telescope/telescope.nvim',
    pin = true,
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-telescope/telescope-fzf-native.nvim'
    },
    ft = 'alpha',
  keys = {
    {[[<leader>ff]], ":Telescope find_files<CR>", desc = 'Telescope Find Files' },
    {[[<leader>fw]], ":Telescope live_grep<CR>", desc = 'Telescope Live Grep' },
  },
    config = function()
      require('telescope').load_extension('fzf')
    end,
  },
  {
    'nvim-telescope/telescope-fzf-native.nvim',
    pin = true,
    build = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build',
    lazy = true,
  },
}
