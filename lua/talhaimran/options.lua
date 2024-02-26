-- Ctrlsf options
vim.g.ctrlsf_position = 'bottom'
vim.g.ctrlsf_auto_focus = {
  at = 'start',
}
vim.g.ctrlsf_case_sensitive = 'yes'

-- Using ctrl-p for auto pairs
vim.g.AutoPairsShortcutToggle = '<C-p>'

-- Copilot
vim.g.copilot_no_tab_map = true
vim.g.copilot_filetypes = {
  ['markdown'] = true,
}

-- Set highlight on search
vim.o.hlsearch = false

-- Make line numbers default
vim.wo.number = true

-- Make relative numbers
vim.wo.relativenumber = true

-- Enable mouse mode
vim.o.mouse = 'a'

-- Sync clipboard between OS and Neovim.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
vim.o.clipboard = 'unnamedplus'

-- Enable break indent
vim.o.breakindent = true

-- Save undo history
vim.o.undofile = true

-- Case-insensitive searching UNLESS \C or capital in search
vim.o.ignorecase = false
vim.o.smartcase = true

-- Keep signcolumn on by default
vim.wo.signcolumn = 'yes'

-- Decrease update time
vim.o.updatetime = 100
vim.o.timeoutlen = 300

-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menuone,noselect'

-- NOTE: You should make sure your terminal supports this
vim.o.termguicolors = true

-- Folding options
vim.o.foldcolumn = '0'
vim.o.foldlevel = 99
vim.o.foldlevelstart = 99
vim.o.foldenable = true
vim.opt.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]]

-- Setting no wrap
vim.opt.wrap = false

-- Setting up default statusline
vim.opt.statusline = ' %t - %y %='

-- Hiding status line
vim.opt.laststatus = 0

-- Set CMD height
vim.opt.cmdheight = 0

-- Set the background color of the status line
vim.api.nvim_exec(
  [[
  hi StatusLine guibg=#303143 guifg=#CAD1EF
]],
  false
)

-- Defining lsp icons
vim.fn.sign_define(
  'DiagnosticSignError',
  { text = '', texthl = 'DiagnosticSignError' }
)
vim.fn.sign_define(
  'DiagnosticSignWarn',
  { text = '', texthl = 'DiagnosticSignWarn' }
)
vim.fn.sign_define(
  'DiagnosticSignInfo',
  { text = '', texthl = 'DiagnosticSignInfo' }
)
vim.fn.sign_define(
  'DiagnosticSignHint',
  { text = '', texthl = 'DiagnosticSignHint' }
)
