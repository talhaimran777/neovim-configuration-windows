require('telescope').setup {
  defaults = {
    mappings = {
      i = {
        ["<S-j>"] = require('telescope.actions').move_selection_next,
        ["<S-k>"] = require('telescope.actions').move_selection_previous,
        ["<C-j>"] = require('telescope.actions').cycle_history_next,
        ["<C-k>"] = require('telescope.actions').cycle_history_prev
      }
    }
  }
}
