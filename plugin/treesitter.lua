vim.api.nvim_create_autocmd(
  'PackChanged',
  {
    callback = function(ev)
      local name, kind = ev.data.spec.name, ev.data.kind
      if name == 'nvim-treesitter' and (kind == 'install' or kind == 'update') then
        vim.schedule(function()
          vim.cmd('TSUpdate')
        end)
      end
    end
  }
)

-- Disabilita le scorciatoie di default per i tipi di file, evitando conflitti con Treesitter
vim.g.no_plugin_maps = true

vim.pack.add({
  'https://github.com/nvim-treesitter/nvim-treesitter',
  {
    src = 'https://github.com/nvim-treesitter/nvim-treesitter-textobjects',
    version = 'main'
  }
})

require('nvim-treesitter').install { 'html', 'latex', 'lua', 'markdown', 'rust', 'python', 'vim', 'yaml' }
