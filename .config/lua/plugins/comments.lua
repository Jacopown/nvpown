return {
  {
    'numToStr/Comment.nvim',
    config = true,
  },
  {
    "folke/todo-comments.nvim",
    lazy = false,
    dependencies = { "nvim-lua/plenary.nvim" },
    keys = {
      { 'ftd', '<cmd>:TodoTelescope<CR>' },
    },
    opts = {
      --TODO: puppa
      --FIX: dhn
      --HACK: minchia
      --PERF: boia
      --NOTE: salame
      --WARNING: caccca
      --BUG: alssoi8fwoiehasf
    }
  }
}
