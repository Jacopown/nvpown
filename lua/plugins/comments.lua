return {
  {
    'numToStr/Comment.nvim',
    config = true,
    keys = {
      {'gcc', mode="n", desc = "Toggles the current line using linewise comment"},
      {'gbc', mode="n", desc = "Toggles the current line using blockwise comment"},
      {'gc', mode="v", desc = "Toggles the region using linewise comment"},
      {'gb', mode="v", desc = "Toggles the region using blockwise comment"},
      {'gco', mode="n", desc = "Insert comment to the next line and enters INSERT mode"},
      {'gcO', mode="n", desc = "Insert comment to the previous line and enters INSERT mode"},
      {'gcA', mode="n", desc = "Insert comment to end of the current line and enters INSERT mode"},
    }
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
