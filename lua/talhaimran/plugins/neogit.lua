return {
  'NeogitOrg/neogit',
  config = true,
  keys = {
    {
      '<leader>gs',
      function()
        require('neogit').open()
      end,
      desc = 'Open Neogit',
    },
  },
}
