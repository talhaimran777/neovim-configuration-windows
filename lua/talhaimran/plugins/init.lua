return {
  'github/copilot.vim',
  'tpope/vim-fugitive',
  'tpope/vim-sleuth',
  'tpope/vim-surround',
  {
    'catppuccin/nvim',
    name = 'catppuccin',
    priority = 1000,
    config = function()
      vim.cmd([[colorscheme catppuccin-mocha]])
    end,
  },
  {
    {
      'CopilotC-Nvim/CopilotChat.nvim',
      branch = 'main',
      dependencies = {
        { 'zbirenbaum/copilot.lua' },
        { 'nvim-lua/plenary.nvim' },
      },
      build = 'make tiktoken',
      opts = {
        debug = false,
        mappings = {
          reset = {
            normal = '<leader>cr',
            insert = '<leader>cr',
          },
        },
      },
    },
  },
}
