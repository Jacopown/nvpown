local update = not require('update').ccc and not require('update').all
return {
  {
    'uga-rosa/ccc.nvim',
    pin = update,
    opts = {
      highlighter = {
        auto_enable = true,
	  },
    },
  },
}
