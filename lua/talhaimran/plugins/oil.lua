return {
  'stevearc/oil.nvim',
  opts = {
    keymaps = {
      ['<A-x>'] = 'actions.close',
    },
  },
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  keys = {
    { '<A-x>', '<cmd>Oil<cr>', desc = 'Oil' },
  },
}
