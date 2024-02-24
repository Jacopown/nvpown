local icons = require('icons')
return {
  {
    'hrsh7th/nvim-cmp',
    -- pin = ture,
    dependencies = {
      -- 'windwp/nvim-autopairs',
      'neovim/nvim-lspconfig',
      { 'hrsh7th/cmp-nvim-lsp', --[[ pin = ture, ]] },
      'VonHeikemen/lsp-zero.nvim',
      'zbirenbaum/copilot-cmp',
      { 'hrsh7th/cmp-buffer', --[[ pin = true, ]] },
      {'L3MON4D3/LuaSnip'},
      { 'saadparwaiz1/cmp_luasnip', --[[ pin = ture, ]] },
      -- { 'hrsh7th/cmp-path', --[[ pin = true, ]] },
      -- { 'hrsh7th/cmp-cmdline', --[[ pin = true, ]] },
      -- { 'hrsh7th/cmp-emoji', --[[ pin = true, ]] },
      -- { 'kdheepak/cmp-latex-symbols', --[[ pin = true, ]] },
      -- { 'hrsh7th/cmp-nvim-lua', --[[ pin = true, ]] },
    },
    config = function()
      local cmp_ok, cmp = pcall(require, "cmp")
      if not cmp_ok then
        vim.notify("There was a problem while requiring cmp plugin")
      end

      local lsp_zero_ok, lsp_zero = pcall(require, 'lsp-zero')
      if not lsp_zero_ok then
        vim.notify("There was a problem while requiring lsp-zero plugin in cmp file")
      end

      local cmp_format = lsp_zero.cmp_format()
      local cmp_action = lsp_zero.cmp_action()

      lsp_zero.extend_cmp()
      -- local cmp_autopairs_ok, cmp_autopairs = pcall(require, 'nvim-autopairs.completion.cmp')
      -- if not cmp_autopairs_ok then
      --   vim.notify("There was a problem while requiring cmp plugin")
      -- end
      --
      -- local luasnip_ok, luasnip = pcall(require, "luasnip")
      -- if not luasnip_ok then
      --   vim.notify("There was a problem while requiring luasnip plugin")
      -- end
      --
      -- local cmp_action = require('lsp-zero').cmp_action()
      --
      -- local has_words_before = function()
      --   if vim.api.nvim_buf_get_option(0, "buftype") == "prompt" then return false end
      --   local line, col = unpack(vim.api.nvim_win_get_cursor(0))
      --   return col ~= 0 and vim.api.nvim_buf_get_text(0, line - 1, 0, line - 1, col, {})[1]:match("^%s*$") == nil
      -- end
      --
      -- cmp.event:on(
      --   'confirm_done',
      --   cmp_autopairs.on_confirm_done()
      -- )

      cmp.setup {
        -- enabled = function()
        --   -- disable completion in comments
        --   local context = require 'cmp.config.context'
        --   -- keep command mode completion enabled when cursor is in a comment
        --   if vim.api.nvim_get_mode().mode == 'c' then
        --     return true
        --   else
        --     return not context.in_treesitter_capture("comment")
        --         and not context.in_syntax_group("Comment")
        --   end
        -- end,
        -- snippet = {
        --   expand = function(args)
        --     luasnip.lsp_expand(args.body)
        --   end
        -- },
        window = {
          completion = cmp.config.window.bordered(),
          documentation = cmp.config.window.bordered(),
        },
        preselect = 'item',
        completion = {
            completeopt = 'menu,menuone,noinsert'
        },
        mapping = cmp.mapping.preset.insert({
          -- ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
          ['<CR>'] = cmp.mapping.confirm({
            behavior = cmp.ConfirmBehavior.Replace,
            select = false,
          }),
          ['<Tab>'] = cmp_action.luasnip_supertab(),
          ['<S-Tab>'] = cmp_action.luasnip_shift_supertab(),
          -- ["<Tab>"] = vim.schedule_wrap(function(fallback)
          --   if cmp.visible() and has_words_before() then
          --     cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
          --   else
          --     fallback()
          --   end
          -- end),
        }),
        sources = {
          { name = "copilot" },
          { name = 'nvim_lsp' },
          { name = 'buffer' },
          -- { name = 'nvim_lua' },
          -- { name = 'path' },
          -- { name = 'emoji' },
          -- { name = 'latex_symbols', option = { strategy = 2, }, },
          -- { name = 'luasnip' },
        },
        -- view = {
        --   entries = {
        --     name = 'custom',
        --     selection_order = 'near_cursor'
        --   }
        -- },
        formatting = cmp_format,
        -- formatting = {
        --   format = function(entry, vim_item)
        --     -- Kind icons
        --     vim_item.kind = string.format('%s %s', icons[vim_item.kind], vim_item.kind) -- This concatonates the icons with the name of the item kind
        --     -- Source
        --     vim_item.menu = ({
        --       copilot = "[Copilot]",
        --       buffer = "[Buffer]",
        --       nvim_lsp = "[LSP]",
        --       luasnip = "[LuaSnip]",
        --       nvim_lua = "[NvimLua]",
        --       latex_symbols = "[LaTeX]",
        --       path = '[Path]',
        --       cmdline = '[CmdLine]',
        --       emoji = '[Emoji]'
        --     })[entry.source.name]
        --     return vim_item
        --   end
        -- },
        experimental = {
          ghost_text = true,
        },
      }

      -- cmp.setup.cmdline('/', { mapping = cmp.mapping.preset.cmdline(), })

      -- cmp.setup.cmdline(':', {
      --   mapping = cmp.mapping.preset.cmdline(),
      --   sources = cmp.config.sources({
      --     { name = 'path' }
      --   }, {
      --     {
      --       name = 'cmdline',
      --       option = {
      --         ignore_cmds = {}
      --       }
      --     }
      --   })
      -- })
    end
  },
  -- {
  --   'L3MON4D3/LuaSnip',
  --   -- pin = ture,
  --   dependencies = {
  --     {
  --       'rafamadriz/friendly-snippets',
  --       -- pin = true,
  --     },
  --   },
  --   build = 'make install_jsregexp',
  --   config = function()
  --     require("luasnip.loaders.from_vscode").lazy_load()
  --   end,
  -- },
}
