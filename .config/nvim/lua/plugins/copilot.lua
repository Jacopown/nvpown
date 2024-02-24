return {
  {
    'zbirenbaum/copilot.lua',
    pin = true,
    opts = {
      suggestion = { enabled = false },
      panel = { enabled = false },
    },
  },
  {
    "zbirenbaum/copilot-cmp",
    config = true,
    dependencies = {
      'zbirenbaum/copilot.lua',
    },
  },
}
