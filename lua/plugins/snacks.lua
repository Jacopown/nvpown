return {
  "folke/snacks.nvim",
  opts = {
    dashboard = {},
    explorer = { replace_netrw = false },
    indent = {},
    zen = {},
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
    { "<leader>fw", function() Snacks.picker.grep() end, desc = "Find Word" },

    { "<leader>fh", function() Snacks.picker.help() end, desc = "Help Pages" },

    { "<leader>fd", function() Snacks.picker.diagnostics() end, desc = "Diagnostics" },
    { "<leader>fD", function() Snacks.picker.diagnostics_buffer() end, desc = "Buffer Diagnostics" },
    { "gr", function() Snacks.picker.lsp_references() end, desc = "Find References" },

    { "<leader>z", function() Snacks.zen() end, desc = "Toggle Zen Mode" },
    { "<S-q>", function() Snacks.bufdelete() end, desc = "Delete Buffer" },
  },
}
