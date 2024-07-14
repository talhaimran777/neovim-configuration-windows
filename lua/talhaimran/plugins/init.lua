return {
  'github/copilot.vim',
  'mg979/vim-visual-multi',
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
      'windwp/nvim-ts-autotag',
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
