vim.pack.add({
  'https://github.com/catgoose/nvim-colorizer.lua.git',
  'https://github.com/folke/which-key.nvim.git',
  'https://github.com/nvim-tree/nvim-web-devicons',
  'https://github.com/nvim-lualine/lualine.nvim.git',
  'https://github.com/stevearc/oil.nvim.git',
})

vim.keymap.set('n', '<leader>?', function() require('which-key').show({ global = false }) end, { desc = 'Buffer Local Keymaps (which-key)' })

require('lualine').setup()
require("oil").setup({
  view_options = {
    show_hidden = true,
  },
})
--   {
--     "jiaoshijie/undotree",
--     keys = { -- load the plugin only when using it's keybinding:
--       { "<leader>u", "<cmd>lua require('undotree').toggle()<cr>" },
--     },
--   },
--   {
--     "kevinhwang91/nvim-ufo",
--     dependencies = { "kevinhwang91/promise-async" },
--     event = "BufReadPost",
--     opts = {
--       provider_selector = function(bufnr, filetype, buftype)
--         return { "lsp", "indent" }
--       end,
--       fold_virt_text_handler = function(virtText, lnum, endLnum, width, truncate)
--         local newVirtText = {}
--         local suffix = (" 󰁂 %d "):format(endLnum - lnum)
--         local sufWidth = vim.fn.strdisplaywidth(suffix)
--         local targetWidth = width - sufWidth
--         local curWidth = 0
--         for _, chunk in ipairs(virtText) do
--           local chunkText = chunk[1]
--           local chunkWidth = vim.fn.strdisplaywidth(chunkText)
--           if targetWidth > curWidth + chunkWidth then
--             table.insert(newVirtText, chunk)
--           else
--             chunkText = truncate(chunkText, targetWidth - curWidth)
--             local hlGroup = chunk[2]
--             table.insert(newVirtText, { chunkText, hlGroup })
--             chunkWidth = vim.fn.strdisplaywidth(chunkText)
--             -- str width has limitations from our interpolation
--             if curWidth + chunkWidth < targetWidth then
--               suffix = suffix .. (" "):rep(targetWidth - curWidth - chunkWidth)
--             end
--             break
--           end
--           curWidth = curWidth + chunkWidth
--         end
--         table.insert(newVirtText, { suffix, "MoreMsg" })
--         return newVirtText
--       end,
--     },
--     config = function(_, opts)
--       require("ufo").setup(opts)
--     end,
--   },
--   {
--     "luukvbaal/statuscol.nvim",
--     lazy = false,
--     config = function()
--       local builtin = require("statuscol.builtin")
--       require("statuscol").setup({
--         relculright = true,
--         segments = {
--           { text = { builtin.foldfunc }, click = "v:lua.ScFa" },
--           { text = { "%s" }, click = "v:lua.ScSa" },
--           { text = { builtin.lnumfunc, " " }, click = "v:lua.ScLa" },
--         },
--       })
--     end,
--   },
-- }
