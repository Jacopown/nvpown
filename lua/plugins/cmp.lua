return {
	{
		"saghen/blink.cmp",
		dependencies = {
			"rafamadriz/friendly-snippets",
			"moyiz/blink-emoji.nvim",
			"giuxtaposition/blink-cmp-copilot",
		},
		version = "*",
		event = "InsertEnter",

		opts = {
			keymap = { preset = "default" },
			appearance = {
				use_nvim_cmp_as_default = true,
				nerd_font_variant = "mono",
			},
			sources = {
				default = { "lsp", "path", "snippets", "buffer", "emoji", "copilot" },
				providers = {
					copilot = {
						name = "copilot",
						module = "blink-cmp-copilot",
						score_offset = 100,
						async = true,
						-- enabled = function()
						--   return vim.g.copilot_enabled == true
						-- end,
					},
					emoji = {
						module = "blink-emoji",
						name = "Emoji",
						score_offset = 15,
						opts = { insert = true },
					},
				},
			},
			completion = {
				menu = {
					border = "rounded",
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
					window = { border = "rounded", winblend = 5 },
				},
			},
		},
		keys = {
			{
				"<leader>c",
				function()
					vim.g.copilot_enabled = not vim.g.copilot_enabled
					if vim.g.copilot_enabled then
            vim.cmd("Copilot enable")
						print("AI Copilot: ON ")
					else
            vim.cmd("Copilot disable")
						print("AI Copilot: OFF ")
					end
				end,
				desc = "Toggle Copilot AI",
			},
		},
	},
	{
		"zbirenbaum/copilot.lua",
		event = "InsertEnter",
		opts = {
			suggestion = { enabled = false },
			panel = { enabled = false },
		},
		config = function(_, opts)
			require("copilot").setup(opts)
			if not vim.g.copilot_enabled then
				vim.cmd("Copilot disable")
			end
		end,
	},
}
