return {
  settings = {
    Lua = {
      hint = {
        enable = true,
      },
      runtime = {
        version = 'LuaJIT',
      },
      workspace = {
        library = {
          vim.env.VIMRUNTIME,
        },
      },
    },
  },
}
