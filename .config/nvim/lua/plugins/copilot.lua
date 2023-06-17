return {
  {
    "zbirenbaum/copilot-cmp",
    config = true,
    dependencies = {
      'zbirenbaum/copilot.lua',
    },
  },
  {
    'zbirenbaum/copilot.lua',
    pin = true,
    opts = {
      suggestion = { enabled = false },
      panel = { enabled = false },
    },
  },
}
