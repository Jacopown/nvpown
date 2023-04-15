return {
  {
    'lukas-reineke/indent-blankline.nvim',
    config = function()
      vim.cmd [[highlight IndentBlanklineChar guifg=#444c5e gui=nocombine]]
    end,
    -- pin = true,
  },
}
