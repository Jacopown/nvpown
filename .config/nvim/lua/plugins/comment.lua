return {
  'numToStr/Comment.nvim',
  pin = true,
  dependencies = {
  },
  keys = {
    { 'gcc',
      mode = { 'n' }
    },
    { 'gc',
      mode = { 'n', 'v' }
    },
    { 'gb',
      mode = { 'n', 'v' }
    },
  },
  config = function()
    require('Comment').setup({
      pre_hook = require('ts_context_commentstring.integrations.comment_nvim').create_pre_hook(),
    })
  end,
}
