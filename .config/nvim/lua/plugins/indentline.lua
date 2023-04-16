return {
  {
    'lukas-reineke/indent-blankline.nvim',
    -- pin = true,
    opts = {
      show_current_context = true,
      show_current_context_start = true,
      use_treesitter = true,
    },
    config = function(_, opts)
      vim.cmd [[highlight IndentBlanklineChar guifg=#444c5e gui=nocombine]]
      require("indent_blankline").setup(opts)
    end,
  },
}
