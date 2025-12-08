return {
	{
		"catgoose/nvim-colorizer.lua",
		event = "VeryLazy",
		opts = {
			lazy_load = true,
			-- other setup options
		},
	},
	{
		"OXY2DEV/markview.nvim",
		ft = "markdown",
	},
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		opts = {
		},
		keys = {
			{
				"<leader>?",
				function()
					require("which-key").show({ global = false })
				end,
				desc = "Buffer Local Keymaps (which-key)",
			},
		},
	},
  {
    "jiaoshijie/undotree",
    keys = { -- load the plugin only when using it's keybinding:
      { "<leader>u", "<cmd>lua require('undotree').toggle()<cr>" },
    },
  },
  {
    'stevearc/oil.nvim',
    opts = {},
    dependencies = { "nvim-tree/nvim-web-devicons" },
    lazy = false,
  }
}
