return {
  'nvim-treesitter/nvim-treesitter',
  pin = true,
  dependencies = {
    'windwp/nvim-ts-autotag',
    'JoosepAlviste/nvim-ts-context-commentstring',
    'nvim-treesitter/playground',
  },
  build = ":TSUpdate",
  opts = {
    auto_install = true,
    ensure_installed = { 'lua', 'vim' }, -- one of "all" or a list of languages
    ignore_install = {},                 -- List of parsers to ignore installing
    highlight = { enable = true },
    incremental_selection = { enable = true }, --[[ test if used ]]
    indent = { enable = true },
    autotag = { enable = true },
  },
  config = function(_, opts)
    require("nvim-treesitter.configs").setup(opts)
  end,
}
