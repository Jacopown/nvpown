vim.pack.add({
  { src = "https://github.com/sheng-tse/jupynvim", version = vim.version.range("*") },
})

local jupynvim = require("jupynvim")
jupynvim.setup({})

-- Fix jupynvim._sync_treesitter_ranges when a notebook has no code cells (all markdown)
-- or when the parser was already initialized on the full buffer before scoping.
local orig_sync = jupynvim._sync_treesitter_ranges
jupynvim._sync_treesitter_ranges = function(nb)
  orig_sync(nb)
  if not vim.treesitter or not nb or not nb.buf or not vim.api.nvim_buf_is_valid(nb.buf) then
    return
  end
  local ft = vim.bo[nb.buf].filetype
  local ok, parser = pcall(
    vim.treesitter.get_parser,
    nb.buf,
    vim.treesitter.language.get_lang(ft) or ft
  )
  if not ok or not parser then return end
  local ok_cur, current = pcall(parser.included_regions, parser)
  -- An unscoped parser has included_regions() == { {} }. If orig_sync left it unscoped
  -- (which happens when there are 0 code cells because row_signature({}) == row_signature({{}}) == ""),
  -- explicitly scope it to {} so Treesitter doesn't highlight markdown cells as Python.
  if ok_cur and type(current) == "table" and #current == 1 and type(current[1]) == "table" and #current[1] == 0 then
    pcall(parser.set_included_regions, parser, {})
  end
end
