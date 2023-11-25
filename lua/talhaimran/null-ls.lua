require("mason").setup()

require("mason-null-ls").setup({
  ensure_installed = {
    "prettierd",
    "stylua",
  },
  automatic_installation = true,
})

require("null-ls").setup({
  sources = {
    require("null-ls").builtins.formatting.prettierd,
    require("null-ls").builtins.formatting.stylua,
  },
})
