return {
  'nvim-telescope/telescope.nvim',
  branch = '0.1.x',
  commit = 'b4da76be54691e854d3e0e02c36b0245f945c2c7',
  dependencies = {
    {
      'nvim-telescope/telescope-fzf-native.nvim',
      build = 'make',
      cond = function()
        return vim.fn.executable('make') == 1
      end,
    },
    {
      'nvim-telescope/telescope-live-grep-args.nvim',
      version = '^1.0.0',
    },
  },
  config = function()
    local telescope = require('telescope')
    local trouble = require('trouble.sources.telescope')

    telescope.setup({
      defaults = {
        sorting_strategy = 'ascending',
        mappings = {
          i = {
            ['<C-n>'] = require('telescope.actions').move_selection_next,
            ['<C-p>'] = require('telescope.actions').move_selection_previous,
            ['<C-j>'] = require('telescope.actions').cycle_history_next,
            ['<C-k>'] = require('telescope.actions').cycle_history_prev,
            ['<c-t>'] = trouble.open,
          },
          n = {
            ['<c-t>'] = trouble.open,
            ['<C-n>'] = require('telescope.actions').move_selection_next,
            ['<C-p>'] = require('telescope.actions').move_selection_previous,
            ['<C-j>'] = require('telescope.actions').cycle_history_next,
            ['<C-k>'] = require('telescope.actions').cycle_history_prev,
          },
        },
      },
      pickers = {
        live_grep = {
          theme = 'dropdown',
          previewer = false,
        },

        grep_string = {
          theme = 'dropdown',
          previewer = false,
        },

        find_files = {
          theme = 'dropdown',
          previewer = false,
          hidden = true,
          no_ignore = true,
        },

        git_files = {
          theme = 'dropdown',
          previewer = false,
        },

        buffers = {
          theme = 'dropdown',
          previewer = false,
        },
      },
      extensions = {
        live_grep_args = {
          theme = 'dropdown',
          previewer = false,
        },
      },
    })

    telescope.load_extension('fzf')
    telescope.load_extension('live_grep_args')
  end,
  keys = {
    {
      '<A-p>',
      '<cmd>Telescope git_files<cr>',
      desc = 'Telescope Git Files',
    },
    {
      '<A-g>',
      '<cmd>Telescope find_files<cr>',
      desc = 'Telescope Find Files',
    },
    {
      'gr',
      '<cmd>Telescope lsp_references<cr>',
      desc = 'Telescope LSP References',
    },
    {
      'gd',
      '<cmd>Telescope lsp_definitions<cr>',
      desc = 'Telescope LSP Definations',
    },
    {
      'gt',
      '<cmd>Telescope lsp_type_definitions<cr>',
      desc = 'Telescope LSP Type Definations',
    },
    {
      'gi',
      '<cmd>Telescope lsp_implementations<cr>',
      desc = 'Telescope LSP Implementations',
    },
    {
      'sd',
      '<cmd>Telescope diagnostics<cr>',
      desc = 'Telescope LSP Diagnostics',
    },
    {
      '<leader>pb',
      '<cmd>Telescope buffers<cr>',
      desc = 'Telescope Find Text Across Project',
    },
    {
      '<leader>ps',
      function()
        require('telescope').extensions.live_grep_args.live_grep_args()
      end,
      desc = 'Telescope Find Text Across Project',
    },
    {
      '<leader>w',
      function()
        local live_grep_args_shortcuts =
            require('telescope-live-grep-args.shortcuts')
        live_grep_args_shortcuts.grep_word_under_cursor()
      end,
      desc = 'Telescope live grep for the word under the cursor',
    },
  },
}
