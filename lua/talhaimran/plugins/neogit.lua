return {
  "NeogitOrg/neogit",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "sindrets/diffview.nvim",
  },
  config = true,
  keys = {
    {
      "<leader>gs",
      function()
        require("neogit").open()
      end,
      desc = "Open Neogit",
    },
  },
}
