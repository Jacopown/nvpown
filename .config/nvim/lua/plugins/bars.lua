return {
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = true,
  },
  {
    'akinsho/bufferline.nvim',
    lazy = false,
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    keys = {
      { "<S-q>", "<cmd>bdelete!<cr>", desc = "Close buffer" },
    },
    opts = {
      options = {
        diagnostics = "nvim_lsp",
        close_icon = '󰅖',
      },
    },
    config = true,
  },
}
