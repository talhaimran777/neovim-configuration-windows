require('nvim-treesitter.configs').setup {
  ensure_installed = {
    'tsx'
  },
  context_commentstring = {
    enable = true,
    enable_autocmd = false
  }
}
