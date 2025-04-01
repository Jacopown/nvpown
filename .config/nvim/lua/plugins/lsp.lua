return {
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
      automatic_installation = true,
    },
  },
  {
    "neovim/nvim-lspconfig",
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
    dependencies = "williamboman/mason-lspconfig.nvim",

    opts = {
      servers = {
        lua_ls = {
          settings = {
            Lua = {
              hint = {
                enable = true,
                arrayIndex = "Disable",
              },
              runtime = {
                version = "LuaJIT",
              },
              workspace = {
                library = vim.api.nvim_get_runtime_file("", true),
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
        jsonls = {},
      },
    },
    config = function(_, opts)
      for server, config in pairs(opts.servers) do
        config.capabilities = require("blink.cmp").get_lsp_capabilities(config.capabilities)
        require("lspconfig")[server].setup(config)
      end
    end,
  },
  {
    "nvimtools/none-ls.nvim",
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
