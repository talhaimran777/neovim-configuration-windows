return {
  'folke/trouble.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  opts = {},
  keys = {
    { '<A-s>', '<cmd>Trouble telescope toggle<cr>', desc = 'Trouble Telescope Toggle' },
    { '<A-r>', '<cmd>Trouble telescope refresh<cr>', desc = 'Trouble Telescope Refresh' },
  },
}
