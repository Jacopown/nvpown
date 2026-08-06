vim.pack.add({
    'https://github.com/MeanderingProgrammer/render-markdown.nvim',
    'https://github.com/nvim-treesitter/nvim-treesitter', -- needed for parsers
    'https://github.com/nvim-tree/nvim-web-devicons',
})
vim.pack.add({'https://github.com/Myzel394/easytables.nvim.git'})
require('easytables').setup()
