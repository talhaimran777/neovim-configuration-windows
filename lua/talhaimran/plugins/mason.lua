return {
  "jay-babu/mason-null-ls.nvim",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "williamboman/mason.nvim",
    "jose-elias-alvarez/null-ls.nvim",
  },
  config = function()
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
  end,
}
