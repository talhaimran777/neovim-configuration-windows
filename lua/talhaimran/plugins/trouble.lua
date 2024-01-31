return {
  'folke/trouble.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  opts = {},
  keys = {
    { '<A-s>', '<cmd>TroubleToggle<cr>', desc = 'Trouble Toggle' },
    { '<A-r>', '<cmd>TroubleRefresh<cr>', desc = 'Trouble Refresh' },
  },
}
