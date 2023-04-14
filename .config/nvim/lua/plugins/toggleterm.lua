return {
  'akinsho/toggleterm.nvim',
  pin = true,
  keys = {
    {[[<c-\>]], ":ToggleTerm<CR>", desc = 'ToggleTerm' },
  },
  opts = {
    open_mapping = [[<c-\>]],
    direction = "float",
    float_opts = {
      border = "curved",
    },
  }
}
