vim.pack.add({
  { src = "https://github.com/sheng-tse/jupynvim", version = vim.version.range("*") },
})
require("jupynvim").setup({})
