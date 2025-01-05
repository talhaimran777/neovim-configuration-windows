local Remap = require('talhaimran.keymap')
local nnoremap = Remap.nnoremap
local xnoremap = Remap.xnoremap
local vnoremap = Remap.vnoremap

local live_grep_args_shortcuts = require('telescope-live-grep-args.shortcuts')

-- Close Neovim
nnoremap('<A-w>', ':q!<CR>')

-- Close buffer
nnoremap('<A-c>', ':bdelete<CR>')

-- Resize buffers
nnoremap('<C-Left>', ':vertical resize -5<CR>')
nnoremap('<C-Right>', ':vertical resize +5<CR>')

nnoremap('<C-Up>', ':horizontal resize -5<CR>')
nnoremap('<C-Down>', ':horizontal resize +5<CR>')

-- Horizontal navigation
nnoremap('<C-]>', 'zL')
nnoremap('<C-[>', 'zH')

-- Remove & paste but still in register
xnoremap('<leader>p', '"_dP')

-- Window navigation
nnoremap('<A-j>', '<C-w>j')
nnoremap('<A-k>', '<C-w>k')
nnoremap('<A-h>', '<C-w>h')
nnoremap('<A-l>', '<C-w>l')

-- Move text
vnoremap('<', '<gv')
vnoremap('>', '>gv')
xnoremap('J', ":move '>+1<CR>gv-gv")
xnoremap('K', ":move '<-2<CR>gv-gv")

-- Vim Fugitive
nnoremap('<leader>fh', ':0GcLog<CR>')

-- Remaping vim motions
nnoremap('yyp', ':co.<CR>')

-- Better Vertical Motion
nnoremap('<C-d>', '<C-d>zz')
nnoremap('<C-u>', '<C-u>zz')
nnoremap('{', 'zz{')
nnoremap('}', 'zz}')

-- Search repeat
nnoremap('n', 'nzzzv')
nnoremap('N', 'Nzzzv')

-- Remap for reset buffer
nnoremap('<leader>rr', ':e!<CR>')
nnoremap('<leader>lr', ':LspRestart<CR>')

-- Grep visual selection
vnoremap('<leader>w', live_grep_args_shortcuts.grep_visual_selection)

-- Move up & down with wrapped lines
nnoremap('j', 'v:lua._smart_j()', { expr = true, noremap = true })
nnoremap('k', 'v:lua._smart_k()', { expr = true, noremap = true })

-- Diagnostic hide & show
nnoremap('<leader>dh', ':lua vim.diagnostic.disable()<CR>')
nnoremap('<leader>ds', ':lua vim.diagnostic.enable()<CR>')

-- Avante
nnoremap('<leader>cc', ':AvanteToggle<CR>')

-- Typescript OrganizeImports
vim.cmd('command! -nargs=0 OR lua OrganizeImports()')

-- Format
nnoremap('<A-y>', function()
  vim.lsp.buf.format({
    filter = function(client)
      return client.name ~= 'ts_ls' and client.name ~= 'lua_ls'
    end,
    async = true,
  })
end)

xnoremap('<A-y>', function()
  vim.lsp.buf.format({
    filter = function(client)
      return client.name ~= 'ts_ls' and client.name ~= 'lua_ls'
    end,
    async = true,
  })
end)

-- Diff Get
nnoremap('gh', '<cmd>diffget //2<CR>')
nnoremap('gl', '<cmd>diffget //3<CR>')

-- Remap zc to create and do fold
nnoremap('zc', 'V$%ojokzfk')
nnoremap('zo', 'jzok')

-- Splits
nnoremap('<leader>sl', '<cmd>vsplit<CR>')
nnoremap('<leader>sj', '<cmd>split<CR>')

function _smart_j()
  local count = vim.v.count
  local mode = vim.fn.mode(1)
  if count ~= 0 or mode:sub(1, 2) == 'no' then
    return 'j'
  else
    return 'gj'
  end
end

function _smart_k()
  local count = vim.v.count
  local mode = vim.fn.mode(1)
  if count ~= 0 or mode:sub(1, 2) == 'no' then
    return 'k'
  else
    return 'gk'
  end
end

function OrganizeImports()
  vim.lsp.buf.execute_command({
    command = '_typescript.organizeImports',
    arguments = { vim.fn.expand('%:p') },
  })
end
