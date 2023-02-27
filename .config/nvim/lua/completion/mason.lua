local mason_ok, mason = pcall(require, "mason")
if not mason_ok then
	vim.notify("There was a problem while requiring mason plugin")
end

mason.setup({
  ui = {
    border = "rounded",
    icons = {
      package_installed = "✓",
      package_pending = "➜",
      package_uninstalled = "✗"
    }
  }
})
