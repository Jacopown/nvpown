return {
  {
    'nvim-telescope/telescope.nvim',
    pin = true,
    dependencies = {
      'nvim-lua/plenary.nvim',
      { 'nvim-telescope/telescope-fzf-native.nvim', pin = true, build = 'make' }
    },
    ft = 'alpha',
    keys = {
      { [[<leader>ff]], ":Telescope find_files follow=true<CR>", desc = 'Telescope Find Files' },
      { [[<leader>fw]], ":Telescope live_grep<CR>",              desc = 'Telescope Live Grep' },
      { [[<leader>e]],  ":Telescope file_browser<CR>",           desc = 'Telescope File Browser' },
    },
    config = function()
      local actions = require("telescope.actions")
      require('telescope').setup {
        defaults = {
          mappings = {
            i = { ["<esc>"] = actions.close },
          },
          preview = {
            mime_hook = function(filepath, bufnr, opts)
              local is_image = function(filepath)
                local image_extensions = { 'png', 'jpg' } -- Supported image formats
                local split_path = vim.split(filepath:lower(), '.', { plain = true })
                local extension = split_path[#split_path]
                return vim.tbl_contains(image_extensions, extension)
              end
              if is_image(filepath) then
                local term = vim.api.nvim_open_term(bufnr, {})
                local function send_output(_, data, _)
                  for _, d in ipairs(data) do
                    vim.api.nvim_chan_send(term, d .. '\r\n')
                  end
                end
                vim.fn.jobstart(
                  {
                    'viu', filepath -- Terminal image viewer command
                  },
                  { on_stdout = send_output, stdout_buffered = true, pty = true })
              else
                require("telescope.previewers.utils").set_preview_message(bufnr, opts.winid, "Binary cannot be previewed")
              end
            end
          },
        },
        pickers = {
          find_files = {
            follow = true,
            hidden = true,
            no_ignore = true,
          },
        },
        extensions = {
          file_browser = {
            follow_symlinks = true,
            hidden = true,
            ninja_ignore = true,
          },
        },
      }
      require('telescope').load_extension('fzf')
      require('telescope').load_extension('file_browser')
    end,
  },
  {
    'nvim-telescope/telescope-file-browser.nvim',
    pin = true,
    dependencies = { 'nvim-telescope/telescope.nvim', 'nvim-lua/plenary.nvim' }
  },
}
