return {
  'Fymyte/rasi.vim',
  pin = true,
  dependencies = {
    'nvim-treesitter/nvim-treesitter',
  },
  build = ':TSInstall rasi',
  ft = { 'rasi' },
}
