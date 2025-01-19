return {
  "yetone/avante.nvim",
  event = "VeryLazy",
  lazy = false,
  version = false,
  opts = {
    provider = "copilot"
  },
  build = "make",
  dependencies = {
    "stevearc/dressing.nvim",
    "MunifTanjim/nui.nvim",
  },
}
