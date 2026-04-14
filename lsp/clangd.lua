return {
  settings = {},
  cmd = {
    'clangd',
    '--query-driver=/usr/bin/c++,/opt/cuda/bin/nvcc,/usr/bin/clang++,/usr/bin/g++',
    '--log=verbose'
  },
}
