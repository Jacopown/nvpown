return {
  'saghen/blink.cmp',
  dependencies = {
    'rafamadriz/friendly-snippets',
    "moyiz/blink-emoji.nvim",
  },
  version = '*',
  event = "InsertEnter",

  opts = {
    keymap = { preset = 'default' },
    appearance = {
      use_nvim_cmp_as_default = true,
      nerd_font_variant = 'mono'
    },
    sources = {
      default = { 'lsp', 'path', 'snippets', 'buffer', 'emoji' },
      providers = {
        emoji = {
          module = "blink-emoji",
          name = "Emoji",
          score_offset = 15,        -- Tune by preference
          opts = { insert = true }, -- Insert emoji (default) or complete its name
        }
      }
    },
    completion = {
      menu = {
        draw = {
          columns = { { 'kind_icon' }, { 'label', 'label_description', gap = 1 }, { 'source_name' } },
          treesitter = { 'lsp', 'path', 'snippet', 'buffer' },
        },
      },
      ghost_text = {
        enabled = true
      },
      documentation = {
        auto_show = true,
        auto_show_delay_ms = 500,
      }
    },
  }
}
