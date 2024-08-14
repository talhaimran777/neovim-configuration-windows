return {
  'github/copilot.vim',
  'tpope/vim-fugitive',
  'tpope/vim-sleuth',
  'tpope/vim-surround',
  'terrortylor/nvim-comment',
  'alexghergh/nvim-tmux-navigation',
  {
    'catppuccin/nvim',
    name = 'catppuccin',
    priority = 1000,
    config = function()
      vim.cmd([[colorscheme catppuccin-mocha]])
    end,
  },
  {
    'nvim-treesitter/nvim-treesitter',
    dependencies = {
      'JoosepAlviste/nvim-ts-context-commentstring',
    },
    build = ':TSUpdate',
    event = { 'BufReadPre', 'BufNewFile' },
  },
  {
    'kevinhwang91/nvim-ufo',
    event = 'BufEnter',
    dependencies = {
      'kevinhwang91/promise-async',
    },
    config = true,
  },
}
