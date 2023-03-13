local alpha_ok, alpha = pcall(require, 'alpha')
if not alpha_ok then
	vim.notify("There was a problem while requiring alpha plugin")
end

local dashboard_ok, dashboard = pcall(require, 'alpha.themes.dashboard')
if not dashboard_ok then
	vim.notify("There was a problem while requiring alpha.themes.dashboard plugin")
end

-- Set header
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

-- Set menu
dashboard.section.buttons.val = {
    dashboard.button( "e", "  > New file" , ":ene <BAR> startinsert <CR>"),
    dashboard.button( "f", "  > Find file", ":Telescope find_files<CR>"),
    dashboard.button( "r", "  > Recent"   , ":Telescope oldfiles<CR>"),
    dashboard.button( "s", "  > Settings" , ":e ~/.config/nvim/init.lua <CR>"),
    dashboard.button( "q", "  > Quit NVIM", ":qa<CR>"),
  -- button("p", icons.git.Repo .. " Find project", ":lua require('telescope').extensions.projects.projects()<CR>"),
  -- dashboard.button("t",  " Find text", ":Telescope live_grep <CR>"),
  -- -- dashboard.button("s", icons.ui.SignIn .. " Find Session", ":silent Autosession search <CR>"),
  -- button("s", icons.ui.SignIn .. " Find Session", ":SearchSession<CR>"),
  -- button("u", icons.ui.CloudDownload .. " Update", ":PackerSync<CR>"),
}

-- local function footer()
--                 local total_plugins = #vim.tbl_keys(packer_plugins)
--                 local datetime = os.date(" %d-%m-%Y   %H:%M:%S")
--                 local version = vim.version()
--                 local nvim_version_info = "   v" .. version.major .. "." .. version.minor .. "." .. version.patch
--
--                 return datetime .. "   " .. total_plugins .. " plugins" .. nvim_version_info
--             end
--
-- dashboard.section.footer.val = {footer()}

dashboard.config.opts.noautocmd = true

-- Send config to alpha
alpha.setup({
  layout = {
    dashboard.section.header,
    dashboard.section.buttons,
    -- dashboard.section.footer,
  }
})

-- Disable folding on alpha buffer
-- vim.cmd([[
--     autocmd FileType alpha setlocal nofoldenable
-- ]])
