return {
	{
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function(_, opts)
      require("nvim-treesitter.configs").setup(opts)
    end,
    opts = {
      ensure_installed = {},
      highlight = {
        enable = true,
        ensure_installed = { "c", "lua", "rust" },

        -- Install parsers synchronously (only applied to `ensure_installed`)
        sync_install = false,

        -- Automatically install missing parsers when entering buffer
        auto_install = false,
      },
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "<Leader>ss",
          node_incremental = "<Leader>si",
          scope_incremental = "<Leader>sc",
          node_decremental = "<Leader>sd",
        },
        indent = {
          enable = true
        },
      },
      textobjects = {
        select = {
          enable = true,

          -- Automatically jump forward to textobj, similar to targets.vim
          lookahead = true,

          keymaps = {
            -- You can use the capture groups defined in textobjects.scm
            ["af"] = { query = "@function.outer",desc = "Select outer part of a function"},
            ["if"] = { query = "@function.inner",desc = "Select inner part of a function"},
            ["ac"] = { query = "@class.outer",desc = "Select outer part of a class region"},
            ["ic"] = { query = "@class.inner", desc = "Select inner part of a class region" },
            ["as"] = { query = "@local.scope", query_group = "locals", desc = "Select language scope" },
          },
          selection_modes = {
            ['@parameter.outer'] = 'v', -- charwise
            ['@function.outer'] = 'v', -- linewise
            ['@class.outer'] = '<c-v>', -- blockwise
          },
          include_surrounding_whitespace = true,
        },
      },
    },
  },
  {'nvim-treesitter/nvim-treesitter-textobjects'}
}
