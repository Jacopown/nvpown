local update = not(require('update').bufferline and require('update').all)
return {
  "akinsho/bufferline.nvim",
  pin = update,
  event = 'VeryLazy',
  dependencies = {
    'nvim-tree/nvim-web-devicons',
    'famiu/bufdelete.nvim',
  },
  opts = {
    options = {
      close_command = "Bdelete! %d",       -- can be a string | function, see "Mouse actions"
      right_mouse_command = "Bdelete! %d", -- can be a string | function, see "Mouse actions"
      tab_size = 30,
      diagnostics = 'nvim_lsp',
      diagnostics_indicator = function(_, _, diagnostics_dict)
        local s = " "
        for e, n in pairs(diagnostics_dict) do
          local sym = e == "error" and "  "
            or (e == "warning" and "  " or "  " )
          s = s .. n .. sym
        end
        return s
      end,
      offsets = {{ filetype = "neo-tree", text = "", separator = true }},
    },
  },
}
