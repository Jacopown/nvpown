local update = not(require('update').alpha and require('update').all)
return {
  'goolord/alpha-nvim',
  pin = update,
  dependencies = {
    'nvim-tree/nvim-web-devicons',
    -- 'nvim-telescope/telescope.nvim',
  },
  config = function()
    local dashboard = require("alpha.themes.dashboard")
    dashboard.section.header.val = {
      "                                                     ",
      "  ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ",
      "  ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ",
      "  ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ",
      "  ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ",
      "  ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ",
      "  ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ",
      "                                                     ",
    }
    dashboard.section.buttons.val = {
      dashboard.button("b", "󱏒 " .. " File Browser", ":Telescope file_browser <CR>"),
      dashboard.button("f", " " .. " Find file", ":Telescope find_files <CR>"),
      dashboard.button("o", "󰠮 " .. " Obsidian", ":Telescope file_browser path=~/Repos/zettelkasten/zettels <CR>"),
      -- dashboard.button("n", " " .. " New file", ":ene <BAR> startinsert <CR>"),
      dashboard.button("r", " " .. " Recent files", ":Telescope oldfiles <CR>"),
      -- dashboard.button("g", " " .. " Find text", ":Telescope live_grep <CR>"),
      dashboard.button("c", " " .. " Config", ":Telescope file_browser path=$MYVIMRC/.. <CR>"),
      -- dashboard.button("s", " " .. " Restore Session", [[:lua require("persistence").load() <cr>]]),
      dashboard.button("l", "󰒲 " .. " Lazy", ":Lazy<CR>"),
      dashboard.button("q", " " .. " Quit", ":qa<CR>"),
    }
    require("alpha").setup(dashboard.opts)
  end,
}
