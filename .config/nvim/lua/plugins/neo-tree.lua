return {
  'nvim-neo-tree/neo-tree.nvim',
  pin = true,
  dependencies = {
   "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
  },
  keys = {
    { "<leader>e",
      function()
        require("neo-tree.command").execute({ toggle = true, dir = vim.loop.cwd() })
      end,
      desc = "NeoTree Toggle",
    },
  },
  opts = {
    window = {
      position = "right",
      mappings = {
        -- ["l"] = { "toggle_node", nowait = false, },-- disable `nowait` if you have existing combos starting with this char that you want to use 
      },
    },
  },
  filesystem = {
    filtered_items = {
      hide_dotfiles = false,
    },
  },
}
