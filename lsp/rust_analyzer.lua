return {
  settings = {
    ['rust-analyzer'] = {
      rustfmt = {
        extraArgs = { '+stable', '--config', 'tab_spaces=2' },
      },
    },
  },
}
