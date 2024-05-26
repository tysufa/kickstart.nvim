vim.keymap.set('i', 'jk', '<ESC>', { desc = 'exit insert mode' })

local opts = {}
vim.keymap.set('n', '//', ':%s//<Left>', { desc = 'search and replace' }) -- permet de chercher et remplacer tous les termes exact entre \<\>
vim.keymap.set('n', '<leader>n', ':set number!<CR>', { desc = 'toggle line numbers' })
vim.keymap.set('n', '<C-s>', ':w<CR>', opts)
vim.keymap.set('n', '<C-q>', ':wq<CR>', opts)
vim.keymap.set('n', '<C-j>', '<C-e>', opts)
vim.keymap.set('n', '<C-k>', '<C-y>', opts)
vim.keymap.set('n', '<leader>l', '<CMD>set wrap!<CR>', { desc = 'toggle wrapline' })
vim.keymap.set('n', '<leader>ff', function()
  require('conform').format()
end, { desc = '[F]ormat [F]ile' })
vim.keymap.set({ 'n', 'v' }, 'p', 'p:let @+=@0<CR>:let @"=@0<CR>', { desc = "Don't copy replaced text" })

vim.keymap.set('i', '<C-s>', '<esc>:w<CR>a', opts)
vim.keymap.set('i', '<C-q>', '<esc>:wq<CR>', opts)
vim.keymap.set('i', '<c-h>', '<Left>', opts)
vim.keymap.set('i', '<c-l>', '<Right>', opts)
vim.keymap.set('i', '<c-j>', '<Down>', opts)
vim.keymap.set('i', '<c-k>', '<Up>', opts)

-- NOTE: plugins mappings
-- nvim-tree
vim.keymap.set({ 'i', 'n' }, '<C-n>', '<cmd> NvimTreeToggle <CR>', { desc = 'Toggle nvim-tree' })

-- nvim-dap
-- TODO: add those keybindgs in the plugins loading to avoid loading them all the time
vim.keymap.set('n', '<leader>db', '<cmd>DapToggleBreakpoint<CR>', { desc = 'toggle breakpoint' })
vim.keymap.set('n', '<leader>dc', '<cmd>DapContinue<CR>', { desc = 'start or continue the debugger' })
vim.keymap.set('n', '<leader>dus', function()
  local widgets = require 'dap.ui.widgets'
  local sidebar = widgets.sidebar(widgets.scopes)
  sidebar.open()
end, { desc = 'open sidebar' })

vim.keymap.set('n', '<leader>dgt', function()
  require('dap-go').debug_test()
end, { desc = 'debug go test' })

vim.keymap.set('n', '<leader>dgl', function()
  require('dap-go').debug_last()
end, { desc = 'debug last go test' })

print 'test1'
