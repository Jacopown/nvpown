return {
  "folke/snacks.nvim",
  opts = {
    dashboard = {},
    explorer = { replace_netrw = false },
    picker = {
      sources = {
        files = {
          hidden = true,
          ignored = true,
          follow = true,
        },
      },
    },
  },
  keys = {
    { "<leader>ff", function() Snacks.picker.files() end, desc = "Find Files" },
    { "<leader>fh", function() Snacks.picker.help() end, desc = "Help Pages" },
    { "<leader>sd", function() Snacks.picker.diagnostics() end, desc = "Diagnostics" },
    { "<leader>sD", function() Snacks.picker.diagnostics_buffer() end, desc = "Buffer Diagnostics" },
    { "gD", function() Snacks.picker.lsp_declarations() end, desc = "Declarations" },
    { "gd", function() Snacks.picker.lsp_definitions() end, desc = "Definitions" },
    { "gr", function() Snacks.picker.lsp_references() end, desc = "Implementations" },
    { "<S-q>", function() Snacks.bufdelete() end, desc = "Delete Buffer" },
  },
}
