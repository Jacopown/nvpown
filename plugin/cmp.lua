vim.pack.add({
  { src = 'https://github.com/saghen/blink.cmp.git', version = vim.version.range('1.x') },
  'https://github.com/moyiz/blink-emoji.nvim.git',
  'https://github.com/rafamadriz/friendly-snippets.git',
  'https://github.com/disrupted/blink-cmp-conventional-commits.git',
--   'https://github.com/zbirenbaum/copilot.lua.git',
--   'https://github.com/copilotlsp-nvim/copilot-lsp.git'
})
-- require('copilot').setup({
--   suggestion = { enabled = false },
--   panel = { enabled = false },
--   filetypes = {
--     markdown = true,
--     help = true,
--   },
-- })

require('blink-cmp').setup({
  appearance = {
    nerd_font_variant = "mono",
  },
  sources = {
    default = { "lsp", "path", "snippets", "buffer", "emoji", 'conventional_commits'},
    providers = {
      emoji = {
        module = "blink-emoji",
        name = "Emoji",
      },
      conventional_commits = {
        name = 'Conventional Commits',
        module = 'blink-cmp-conventional-commits',
      },
    },
  },
  completion = {
    menu = {
      winblend = 5,
      draw = {
        columns = { { "kind_icon", gap = 1 }, { "label", "label_description", gap = 1 }, { "source" } },
        components = {
          source = {
            text = function(ctx)
              local source_icons = {
                lsp = "󱐋",
                path = "󰉋",
                snippets = "󰘦",
                buffer = "󰈙",
                emoji = "󰞅",
                copilot = "",
              }
              local name = ctx.source_name:lower()
              local icon = source_icons[name] or "󰔚"
              return icon .. " " .. name:sub(1, 1):upper() .. name:sub(2)
            end,
            highlight = "BlinkCmpSource",
          },
        },
      },
    },
    ghost_text = { enabled = true },
    documentation = {
      auto_show = true,
      auto_show_delay_ms = 250,
      window = { winblend = 5 },
    },
  }
})
vim.api.nvim_set_hl(0, "BlinkCmpMenu", { link = "Normal" })
vim.api.nvim_set_hl(0, "BlinkCmpMenuBorder", { link = "Normal" })
-- 		keys = {
-- 			{
-- 				"<leader>c",
-- 				function()
-- 					vim.g.copilot_enabled = not vim.g.copilot_enabled
-- 					if vim.g.copilot_enabled then
--             vim.cmd("Copilot enable")
-- 						print("AI Copilot: ON ")
-- 					else
--             vim.cmd("Copilot disable")
-- 						print("AI Copilot: OFF ")
-- 					end
-- 				end,
-- 				desc = "Toggle Copilot AI",
-- 			},
-- 		},
-- 	},
-- 	{
-- 		"zbirenbaum/copilot.lua",
-- 		event = "InsertEnter",
-- 		opts = {
-- 			suggestion = { enabled = false },
-- 			panel = { enabled = false },
-- 		},
-- 		config = function(_, opts)
-- 			require("copilot").setup(opts)
-- 			if not vim.g.copilot_enabled then
-- 				vim.cmd("Copilot disable")
-- 			end
-- 		end,
-- 	},
-- }
