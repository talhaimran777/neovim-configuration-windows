return {
  'nvim-treesitter/nvim-treesitter',
  dependencies = {
    'JoosepAlviste/nvim-ts-context-commentstring',
  },
  build = ':TSUpdate',
  event = { 'BufReadPre', 'BufNewFile' },
  config = function()
    local configs = require('nvim-treesitter.configs')

    configs.setup({
      ensure_installed = {
        'lua',
        'tsx',
        'javascript',
        'typescript',
        'vimdoc',
        'vim',
      },
      ignore_install = {},
      modules = {},
      auto_install = false,
      sync_install = false,
      highlight = { enable = true },
      indent = { enable = true },
      autopairs = { enable = true },
    })
  end,
}
