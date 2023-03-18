local toggleterm_ok, toggleterm = pcall(require, "toggleterm")
if not toggleterm_ok then
  vim.notify("There was a problem while requiring toggleterm plugin")
end

toggleterm.setup({
  open_mapping = [[<leader>/]],
  direction = "float",
  float_opts = {
    border = "curved",
  },
})
