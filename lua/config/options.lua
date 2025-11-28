vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.g.have_nerd_font = true

vim.o.number = true
vim.o.relativenumber = true
vim.o.mouse = "a"
vim.o.showmode = false
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.undofile = true
vim.o.undolevels = 10000
vim.o.signcolumn = "yes"
vim.o.updatetime = 200
vim.o.timeoutlen = 300
vim.o.splitbelow = true
vim.o.splitright = true
vim.o.inccommand = "split"
vim.o.cursorline = true
vim.o.scrolloff = 10
vim.o.sidescrolloff = 10
vim.o.confirm = true
vim.o.tabstop = 2
vim.o.shiftwidth = 2
vim.o.softtabstop = 2
vim.o.expandtab = true

-- vim.diagnostic.config({
--   virtual_text = {
--     prefix = "",        -- no extra symbol since the sign is already shown
--     spacing = 4,        -- space between text and code
--   },
--   signs = true,         -- keep the sign on the left
--   underline = true,
--   update_in_insert = false,
--   severity_sort = true,
-- })

-- local opt = vim.opt
--
-- opt.autowrite = true -- Enable auto write
-- opt.completeopt = "menu,menuone,noselect"
-- opt.conceallevel = 2 -- Hide * markup for bold and italic, but not markers with substitutions
-- opt.fillchars = {
--   foldopen = "",
--   foldclose = "",
--   fold = " ",
--   foldsep = " ",
--   diff = "╱",
--   eob = " ",
-- }
-- opt.foldlevel = 99
-- opt.formatexpr = "v:lua.require'lazyvim.util'.format.formatexpr()"
-- opt.formatoptions = "jcroqlnt" -- tcqj
-- opt.grepformat = "%f:%l:%c:%m"
-- opt.grepprg = "rg --vimgrep"
-- opt.jumpoptions = "view"
-- opt.laststatus = 3 -- global statusline
-- opt.linebreak = true -- Wrap lines at convenient points
-- opt.list = true -- Show some invisible characters (tabs...
-- opt.pumblend = 10 -- Popup blend
-- opt.pumheight = 10 -- Maximum number of entries in a popup
-- opt.ruler = false -- Disable the default ruler
-- opt.sessionoptions = { "buffers", "curdir", "tabpages", "winsize", "help", "globals", "skiprtp", "folds" }
-- opt.shiftround = true -- Round indent
-- opt.shiftwidth = 2 -- Size of an indent
-- opt.shortmess:append({ W = true, I = true, c = true, C = true })
-- opt.smartindent = true -- Insert indents automatically
-- opt.spelllang = { "en" }
-- opt.termguicolors = true -- True color support
-- opt.virtualedit = "block" -- Allow cursor to move where there is no text in visual block mode
-- opt.wildmode = "longest:full,full" -- Command-line completion mode
-- opt.winminwidth = 5 -- Minimum window width
-- opt.wrap = false -- Disable line wrap
--
-- opt.smoothscroll = true
-- opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
-- opt.foldmethod = "expr"
-- opt.foldtext = ""
--
-- -- Fix markdown indentation settings
-- vim.g.markdown_recommended_style = 0
