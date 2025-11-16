-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
-- This file is automatically loaded by lazyvim.config.init

-- DO NOT USE `LazyVim.safe_keymap_set` IN YOUR OWN CONFIG!!
-- use `vim.keymap.set` instead
local map = vim.keymap.set

vim.g.mapleader = " "
vim.g.maplocalleader = " "

map("i", "kj", "<ESC>", { desc = "Faster <Esc>", noremap = true })
map("n", "<ESC>", "<cmd>nohlsearch<CR>", { desc = "Deactivate hlsearch", noremap = true })

-- Move to window using the <ctrl> hjkl keys
-- map("n", "<C-h>", "<C-w>h", { desc = "Go to Left Window", remap = true })
-- map("n", "<C-j>", "<C-w>j", { desc = "Go to Lower Window", remap = true })
-- map("n", "<C-k>", "<C-w>k", { desc = "Go to Upper Window", remap = true })
-- map("n", "<C-l>", "<C-w>l", { desc = "Go to Right Window", remap = true })

-- -- Resize window using <ctrl> arrow keys
-- map("n", "<C-Up>", "<cmd>resize +2<cr>", { desc = "Increase Window Height" })
-- map("n", "<C-Down>", "<cmd>resize -2<cr>", { desc = "Decrease Window Height" })
-- map("n", "<C-Left>", "<cmd>vertical resize -2<cr>", { desc = "Decrease Window Width" })
-- map("n", "<C-Right>", "<cmd>vertical resize +2<cr>", { desc = "Increase Window Width" })
--
-- -- Move Lines
-- map("n", "<A-j>", "<cmd>execute 'move .+' . v:count1<cr>==", { desc = "Move Down" })
-- map("n", "<A-k>", "<cmd>execute 'move .-' . (v:count1 + 1)<cr>==", { desc = "Move Up" })
-- map("i", "<A-j>", "<esc><cmd>m .+1<cr>==gi", { desc = "Move Down" })
-- map("i", "<A-k>", "<esc><cmd>m .-2<cr>==gi", { desc = "Move Up" })
-- map("v", "<A-j>", ":<C-u>execute \"'<,'>move '>+\" . v:count1<cr>gv=gv", { desc = "Move Down" })
-- map("v", "<A-k>", ":<C-u>execute \"'<,'>move '<-\" . (v:count1 + 1)<cr>gv=gv", { desc = "Move Up" })
--
-- buffers
map("n", "<S-h>", "<cmd>bprevious<cr>", { desc = "Prev Buffer" })
map("n", "<S-l>", "<cmd>bnext<cr>", { desc = "Next Buffer" })
map("n", "<S-q>", function()
	Snacks.bufdelete()
end, { desc = "Delete Buffer" })

map("n", "<leader>e", function()
	Snacks.picker.files()
end, { desc = "File Explorer" })

--
-- -- Clear search and stop snippet on escape
-- -- map({ "i", "n", "s" }, "<esc>", function()
--   -- vim.cmd("noh")
--   -- LazyVim.cmp.actions.snippet_stop()
--   -- return "<esc>"
-- -- end, { expr = true, desc = "Escape and Clear hlsearch" })
--
-- -- Add undo break-points
-- map("i", ",", ",<c-g>u")
-- map("i", ".", ".<c-g>u")
-- map("i", ";", ";<c-g>u")
--
-- save file
map({ "i", "x", "n", "s" }, "<C-s>", "<cmd>w<cr><esc>", { desc = "Save File" })
--
-- --keywordprg
-- map("n", "<leader>K", "<cmd>norm! K<cr>", { desc = "Keywordprg" })
--
-- -- better indenting
-- map("v", "<", "<gv")
-- map("v", ">", ">gv")
--
-- -- commenting
-- map("n", "gco", "o<esc>Vcx<esc><cmd>normal gcc<cr>fxa<bs>", { desc = "Add Comment Below" })
-- map("n", "gcO", "O<esc>Vcx<esc><cmd>normal gcc<cr>fxa<bs>", { desc = "Add Comment Above" })
--
-- -- lazy
-- map("n", "<leader>l", "<cmd>Lazy<cr>", { desc = "Lazy" })
--
-- -- new file
-- map("n", "<leader>fn", "<cmd>enew<cr>", { desc = "New File" })
--
-- -- location list
-- map("n", "<leader>xl", function()
--   local success, err = pcall(vim.fn.getloclist(0, { winid = 0 }).winid ~= 0 and vim.cmd.lclose or vim.cmd.lopen)
--   if not success and err then
--     vim.notify(err, vim.log.levels.ERROR)
--   end
-- end, { desc = "Location List" })
--
-- -- quickfix list
-- map("n", "<leader>xq", function()
--   local success, err = pcall(vim.fn.getqflist({ winid = 0 }).winid ~= 0 and vim.cmd.cclose or vim.cmd.copen)
--   if not success and err then
--     vim.notify(err, vim.log.levels.ERROR)
--   end
-- end, { desc = "Quickfix List" })
--
-- map("n", "[q", vim.cmd.cprev, { desc = "Previous Quickfix" })
-- map("n", "]q", vim.cmd.cnext, { desc = "Next Quickfix" })
--
-- -- formatting
-- -- map({ "n", "v" }, "<leader>cf", function()
--   -- LazyVim.format({ force = true })
-- -- end, { desc = "Format" })

map({ "n", "v" }, "<leader>ff", function(bufnr)
	vim.lsp.buf.format({
		filter = function(client)
			return client.name == "null-ls"
		end,
		bufnr = bufnr,
	})
end, { desc = "Format" })

-- -- diagnostic/lsp
map("n", "gc", function()
	vim.lsp.buf.code_action()
end, { desc = "Code Action" })

map("n", "gD", function()
	Snacks.picker.lsp_declarations()
end, { desc = "Declarations" })

map("n", "gd", function()
	Snacks.picker.lsp_definitions()
end, { desc = "Definitions" })

map("n", "gr", function()
	Snacks.picker.lsp_references()
end, { desc = "Implementations" })

map("n", "gR", function()
	vim.lsp.buf.rename()
end, { desc = "Rename" })

map("n", "gh", function()
	vim.lsp.buf.signature_help()
end, { desc = "Help" })

-- local diagnostic_goto = function(next, severity)
--   local go = next and vim.diagnostic.goto_next or vim.diagnostic.goto_prev
--   severity = severity and vim.diagnostic.severity[severity] or nil
--   return function()
--     go({ severity = severity })
--   end
-- end
-- map("n", "<leader>d", vim.diagnostic.open_float, { desc = "Line Diagnostics" })
-- map("n", "]d", diagnostic_goto(true), { desc = "Next Diagnostic" })
-- map("n", "[d", diagnostic_goto(false), { desc = "Prev Diagnostic" })
-- map("n", "]e", diagnostic_goto(true, "ERROR"), { desc = "Next Error" })
-- map("n", "[e", diagnostic_goto(false, "ERROR"), { desc = "Prev Error" })
-- map("n", "]w", diagnostic_goto(true, "WARN"), { desc = "Next Warning" })
-- map("n", "[w", diagnostic_goto(false, "WARN"), { desc = "Prev Warning" })
--
-- -- tabs
-- map("n", "<leader><tab>l", "<cmd>tablast<cr>", { desc = "Last Tab" })
-- map("n", "<leader><tab>o", "<cmd>tabonly<cr>", { desc = "Close Other Tabs" })
-- map("n", "<leader><tab>f", "<cmd>tabfirst<cr>", { desc = "First Tab" })
-- map("n", "<leader><tab><tab>", "<cmd>tabnew<cr>", { desc = "New Tab" })
-- map("n", "<leader><tab>]", "<cmd>tabnext<cr>", { desc = "Next Tab" })
-- map("n", "<leader><tab>d", "<cmd>tabclose<cr>", { desc = "Close Tab" })
-- map("n", "<leader><tab>[", "<cmd>tabprevious<cr>", { desc = "Previous Tab" })
