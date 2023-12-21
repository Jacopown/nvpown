return {
  'numToStr/Comment.nvim',
  pin = true,
  keys = {
    {
      'gcc',
      mode = { 'n' }
    },
    {
      'gc',
      mode = { 'n', 'v' }
    },
    {
      'gb',
      mode = { 'n', 'v' }
    },
  },
  config = function()
    require("Comment").setup()
  end,
}
