local function find_root()
	local root_markers = { "mvnw", "gradlew", "pom.xml", "build.gradle", ".git" }
	local path = vim.fn.getcwd()
	while path ~= "/" do
		for _, marker in ipairs(root_markers) do
			if vim.fn.glob(path .. "/" .. marker) ~= "" then
				return path
			end
		end
		path = vim.fn.fnamemodify(path, ":h")
	end
	return vim.fn.getcwd()
end

local home = os.getenv("HOME")
local root_dir = find_root()
local project_name = vim.fn.fnamemodify(root_dir, ":p:h:t")
local workspace_dir = home .. "/.cache/jdtls/workspace/" .. project_name

local path_to_mason_packages = home .. "/.local/share/nvim/mason/packages"
local path_to_jdtls = path_to_mason_packages .. "/jdtls"
local path_to_jar = path_to_jdtls .. "/plugins/org.eclipse.equinox.launcher_1.7.0.v20250519-0528.jar"

local path_to_config = path_to_jdtls .. "/config_linux"

return {
	{
		"neovim/nvim-lspconfig",
		lazy = false,
		keys = {
			{
				"<leader>ff",
				function(bufnr)
					vim.lsp.buf.format({
						filter = function(client)
							return client.name == "null-ls"
						end,
						bufnr = bufnr,
					})
				end,
				mode = { "n", "v" },
			},
			-- {
			--   "<leader>ff",
			--   function()
			--     vim.lsp.buf.format({ async = false})
			--   end,
			--   mode = { "n", "v" },
			-- },
			{
				"gc",
				function()
					vim.lsp.buf.code_action()
				end,
				"n",
			},
			{
				"gD",
				function()
					Snacks.picker.lsp_declarations()
				end,
				"n",
			}, -- usually not implemented by by lsps
			{
				"gd",
				function()
					Snacks.picker.lsp_definitions()
				end,
				"n",
			},
			{
				"<S-k>",
				function()
					vim.lsp.buf.hover()
				end,
				"n",
			},
			{
				"gi",
				function()
					Snacks.picker.lsp_implementations()
				end,
				"n",
			},
			{
				"gr",
				function()
					Snacks.picker.lsp_references()
				end,
				"n",
			},
			{
				"gR",
				function()
					vim.lsp.buf.rename()
				end,
				"n",
			},
			{
				"gh",
				function()
					vim.lsp.buf.signature_help()
				end,
				"n",
			},
		},
		dependencies = {
			"williamboman/mason-lspconfig.nvim",
		},
		opts = {
			servers = {
				lua_ls = {
					settings = {
						Lua = {
							hint = {
								enable = true,
							},
							runtime = {
								version = "LuaJIT",
							},
							workspace = {
								library = {
									vim.env.VIMRUNTIME,
								},
							},
						},
					},
				},
				basedpyright = {
					settings = {
						basedpyright = {
							analysis = {
								-- autoSearchPaths = true,
								-- diagnosticMode = "openFilesOnly",
								-- useLibraryCodeForTypes = true
							},
						},
					},
				},
				clangd = {
					settings = {},
				},
				jdtls = {
					root_markers = {
						"build.xml",
						"pom.xml",
						"settings.gradle",
						"settings.gradle.kts",
						"mvnw",
						"gradlew",
						"build.gradle",
						"build.gradle.kts",
						".git",
					},
					cmd = {
						-- 💀
						"java", -- or '/path/to/java17_or_newer/bin/java'
						-- depends on if `java` is in your $PATH env variable and if it points to the right version.
						"-Declipse.application=org.eclipse.jdt.ls.core.id1",
						"-Dosgi.bundles.defaultStartLevel=4",
						"-Declipse.product=org.eclipse.jdt.ls.core.product",
						"-Dlog.protocol=true",
						"-Dlog.level=ALL",
						"-Xmx1g",
						"--add-modules=ALL-SYSTEM",
						"--add-opens",
						"java.base/java.util=ALL-UNNAMED",
						"--add-opens",
						"java.base/java.lang=ALL-UNNAMED",
						-- 💀
						"-jar",
						path_to_jar,
						-- Must point to the                                                     Change this to
						-- eclipse.jdt.ls installation                                           the actual version
						-- 💀
						"-configuration",
						path_to_config,
						-- ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^        ^^^^^^
						-- Must point to the                      Change to one of `linux`, `win` or `mac`
						-- eclipse.jdt.ls installation            Depending on your system.
						-- 💀
						-- See `data directory configuration` section in the README
						"-data",
						workspace_dir,
					},
					settings = {},
				},
			},
		},

		config = function(_, opts)
			for server, config in pairs(opts.servers) do
				config.capabilities = require("blink.cmp").get_lsp_capabilities(config.capabilities)
				-- if server == "jdtls" then
				-- 	start_or_attach_jdtls(config)
				-- else
				vim.lsp.config(server, config)
				-- end
			end
		end,
	},
	{
		"williamboman/mason.nvim",
		opts = {
			ui = {
				icons = {
					package_installed = "✓",
					package_pending = "➜",
					package_uninstalled = "✗",
				},
			},
		},
	},
	{
		"williamboman/mason-lspconfig.nvim",
		dependencies = "williamboman/mason.nvim",
		opts = {
			ensure_installed = { "lua_ls", "basedpyright", "clangd", "jdtls" },
			-- automatic_enable = {
			-- 	exclude = { "jdtls" },
			-- },
		},
	},
	{
		"nvimtools/none-ls.nvim",
		lazy = false,
		dependencies = "nvim-lua/plenary.nvim",
		opts = function()
			local null_ls = require("null-ls")
			local opts = {
				sources = {
					null_ls.builtins.formatting.stylua,
					null_ls.builtins.formatting.black,
				},
			}
			return opts
		end,
	},
}
