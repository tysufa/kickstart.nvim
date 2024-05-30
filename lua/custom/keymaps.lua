vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous [D]iagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next [D]iagnostic message' })
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Show diagnostic [E]rror messages' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- TIP: Disable arrow keys in normal mode
-- vim.keymap.set('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
-- vim.keymap.set('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
-- vim.keymap.set('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
-- vim.keymap.set('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--
--  See `:help wincmd` for a list of all window commands
vim.keymap.set('n', '<A-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<A-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<A-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<A-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

vim.keymap.set('i', 'jk', '<ESC>', { desc = 'exit insert mode' })

local opts = {}
vim.keymap.set('n', '//', ':%s//<Left>', { desc = 'search and replace' }) -- permet de chercher et remplacer tous les termes exact entre \<\>
vim.keymap.set('n', '<leader>n', ':set number!<CR>', { desc = 'toggle line numbers' })
vim.keymap.set('n', '<C-s>', ':w<CR>', opts)
vim.keymap.set('n', '<C-q>', ':wq<CR>', opts)
vim.keymap.set('n', '<C-j>', '<C-e>', opts)
vim.keymap.set('n', '<C-k>', '<C-y>', opts)
vim.keymap.set('n', '<leader>l', '<CMD>set wrap!<CR>', { desc = 'toggle wrapline' })
-- vim.keymap.set('n', '<leader>ff', function() -- format file but has been integrated in the init.lua
--   require('conform').format()
-- end, { desc = '[F]ormat [F]ile' })
-- vim.keymap.set({ 'n', 'v' }, 'p', 'p:let @+=@0<CR>:let @"=@0<CR>', { desc = "Don't copy replaced text" })

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

local builtin = require 'telescope.builtin'
vim.keymap.set('n', '<leader>sh', builtin.help_tags, { desc = '[S]earch [H]elp' })
vim.keymap.set('n', '<leader>sk', builtin.keymaps, { desc = '[S]earch [K]eymaps' })
vim.keymap.set('n', '<leader>sf', builtin.find_files, { desc = '[S]earch [F]iles' })
vim.keymap.set('n', '<leader>ss', builtin.builtin, { desc = '[S]earch [S]elect Telescope' })
vim.keymap.set('n', '<leader>sw', builtin.grep_string, { desc = '[S]earch current [W]ord' })
vim.keymap.set('n', '<leader>sg', builtin.live_grep, { desc = '[S]earch by [G]rep' })
vim.keymap.set('n', '<leader>sd', builtin.diagnostics, { desc = '[S]earch [D]iagnostics' })
vim.keymap.set('n', '<leader>sr', builtin.resume, { desc = '[S]earch [R]esume' })
vim.keymap.set('n', '<leader>s.', builtin.oldfiles, { desc = '[S]earch Recent Files ("." for repeat)' })
vim.keymap.set('n', '<leader><leader>', builtin.buffers, { desc = '[ ] Find existing buffers' })

-- Slightly advanced example of overriding default behavior and theme
vim.keymap.set('n', '<leader>/', function()
  -- You can pass additional configuration to Telescope to change the theme, layout, etc.
  builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
    winblend = 10,
    previewer = false,
  })
end, { desc = '[/] Fuzzily search in current buffer' })

-- It's also possible to pass additional configuration options.
--  See `:help telescope.builtin.live_grep()` for information about particular keys
vim.keymap.set('n', '<leader>s/', function()
  builtin.live_grep {
    grep_open_files = true,
    prompt_title = 'Live Grep in Open Files',
  }
end, { desc = '[S]earch [/] in Open Files' })

-- Shortcut for searching your Neovim configuration files
vim.keymap.set('n', '<leader>sn', function()
  builtin.find_files { cwd = vim.fn.stdpath 'config' }
end, { desc = '[S]earch [N]eovim files' })

vim.keymap.set('v', 'J', ":m '>+1<cr>gv=gv")
vim.keymap.set('v', 'K', ":m '<-2<cr>gv=gv")

vim.keymap.set('x', '<leader>p', [["_dP]])

vim.keymap.set({ 'n', 'v' }, '<leader>y', [["+y]])
vim.keymap.set('n', '<leader>Y', [["+Y]])

vim.keymap.set({ 'n', 'v' }, '<leader>d', [["_d]])

vim.keymap.set('n', '<leader>rp', [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
vim.keymap.set('n', '<leader>x', '<cmd>!chmod +x %<CR>', { silent = true })

-- TODO : put this in the correct place
vim.keymap.set('n', '<leader>ee', 'oif err != nil {<CR>}<Esc>Oreturn err<Esc>', { desc = 'add golang error test' })

vim.keymap.set('n', '<leader>mr', '<cmd>CellularAutomaton make_it_rain<CR>')

vim.keymap.set('n', '*d', ']d', { remap = true })
vim.keymap.set('n', 'ùd', '[d', { remap = true })

-- OIL
vim.keymap.set('n', '-', '<CMD>Oil<CR>', { desc = 'Open parent directory with Oil' })

-- HARPOON
local harpoonMark = require 'harpoon.mark'
local harpoonUi = require 'harpoon.ui'

vim.keymap.set('n', '<C-A>', function()
  harpoonMark.add_file()
  harpoonUi.toggle_quick_menu()
end, { desc = 'Add current file to harpoon menu' })
vim.keymap.set('n', '<C-e>', harpoonUi.toggle_quick_menu, { desc = 'open harpoon quick menu' })

vim.keymap.set('n', '<C-h>', function()
  harpoonUi.nav_file(1)
end, { desc = 'navigate to harpoon file 1' })
vim.keymap.set('n', '<C-j>', function()
  harpoonUi.nav_file(2)
end, { desc = 'navigate to harpoon file 1' })
vim.keymap.set('n', '<C-k>', function()
  harpoonUi.nav_file(3)
end, { desc = 'navigate to harpoon file 1' })
vim.keymap.set('n', '<C-l>', function()
  harpoonUi.nav_file(4)
end, { desc = 'navigate to harpoon file 1' })

--UNDOTREE
vim.keymap.set('n', '<C-X>', vim.cmd.UndotreeToggle, { desc = 'Toggle undo tree' })

-- NOICE
vim.keymap.set('n', '<leader>nl', function()
  require('noice').cmd 'last'
end, { desc = 'show last last message shown with noice' })

vim.keymap.set('n', '<leader>nh', function()
  require('noice').cmd 'history'
end, { desc = 'show history of messages shown with noice' })

vim.keymap.set('n', '<leader>cl', function()
  require('noice').cmd 'dismiss'
end, { desc = 'clear the screen of all noice notifications' })
