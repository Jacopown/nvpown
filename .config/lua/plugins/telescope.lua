return{
  {
  'nvim-telescope/telescope.nvim',
    lazy = false,
    keys = {
      { "<leader>e", "<cmd>:Telescope file_browser path=%:p:h select_buffer=true<CR>", desc = "Telescope file browser" },
    },
    dependencies = { 
      'nvim-lua/plenary.nvim', 
      { "nvim-telescope/telescope-fzf-native.nvim", 
        build = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release',
      },
    },
    config = function()
      require("telescope").setup {
        extensions = {
          fzf = {
            fuzzy = true,
            override_generic_sorter = true,
            override_file_sorter = true,
            case_mode = "smart_case",
          },
          file_browser = {
            hijack_netrw = true,
            hidden = { file_browser = true, folder_browser = true },
            follow_symlinks = true,
          },
        },
      }
      require('telescope').load_extension('file_browser')
      require('telescope').load_extension('fzf')
    end,
  },
  "nvim-telescope/telescope-file-browser.nvim",
}
