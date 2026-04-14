return {
  settings = {
    basedpyright = {
      analysis = {
        typeCheckingMode = 'standard',
        -- typeCheckingMode = 'all',
        diagnosticSeverityOverrides = {
          -- reportUnknownParameterType = 'none',
          -- reportMissingParameterType = 'none',
          -- reportUnknownArgumentType = 'none',
          -- reportUnknownVariableType = 'none',
          -- reportUnknownMemberType = 'none',
        },
      },
    },
    python = {
      -- venvPath = '~/micromamba/envs/'
      venvPath = '~/mamba/envs/'
    },
  },
}
