return {
  'nvim-treesitter/nvim-treesitter',
  pin = true,
  dependencies = {
    'windwp/nvim-ts-autotag',
    'HiPhish/nvim-ts-rainbow2',
  },
  build = function()
      require("nvim-treesitter.install").update({ with_sync = true })
  end,
  opts = {
    auto_install = true,
    ensure_installed = { 'lua', 'vim', 'c' }, -- one of "all" or a list of languages
    ignore_install = { "" }, -- List of parsers to ignore installing
    highlight = {
      enable = true, -- false will disable the whole extension
      disable = { "" }, -- list of language that will be disabled
      additional_vim_regex_highlighting = true,
    },
    indent = {
      enable = true,
      disable = { "" }
    },
    context_commentstring = {
      enable = true,
      enable_autocmd = false,
    },
    rainbow = {
      enable = true,
    },
    autotag = {
      enable = true,
    },
  },
  config = function(_, opts)
        require("nvim-treesitter.configs").setup(opts)
  end,
}
