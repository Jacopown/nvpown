return {
  'kevinhwang91/nvim-ufo',
  -- pin = true,
  dependencies = {
    'kevinhwang91/promise-async',
    -- {
    --   "luukvbaal/statuscol.nvim",
    --   -- pin = true,
    --   config = function()
    --     local builtin = require("statuscol.builtin")
    --     require("statuscol").setup(
    --       {
    --         relculright = true,
    --         segments = {
    --           {text = {builtin.foldfunc}, click = "v:lua.ScFa"},
    --           {text = {"%s"}, click = "v:lua.ScSa"},
    --           {text = {builtin.lnumfunc, " "}, click = "v:lua.ScLa"}
    --         }
    --       }
    --     )
    --   end
    -- }
  },
  keys = {
    { [[zR]], function() require("ufo").openAllFolds() end,  desc = "Open all folds" },
    { [[zM]], function() require('ufo').closeAllFolds() end, desc = "Close all folds" },
  },
  config = function()
    require("ufo").setup()
    vim.o.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]]
  end,
}
