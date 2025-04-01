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
      { "<leader>ft", function() Snacks.picker.todo_comments() end, desc = "Search todo comments" },
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
