vim.keymap.set('i', 'jk', '<ESC>', { desc = 'exit insert mode' })

local opts = {}
vim.keymap.set('n', '//', ':%s//<Left>', { desc = 'search and replace' }) -- permet de chercher et remplacer tous les termes exact entre \<\>
vim.keymap.set('n', '<leader>n', ':set number!<CR>', { desc = 'toggle line numbers' })
vim.keymap.set('n', '<C-s>', ':w<CR>', opts)
vim.keymap.set('n', '<C-q>', ':wq<CR>', opts)
vim.keymap.set('n', '<C-j>', '<C-e>', opts)
vim.keymap.set('n', '<C-k>', '<C-y>', opts)
vim.keymap.set('n', '<leader>l', '<CMD>set wrap!<CR>', { desc = 'toggle wrapline' })

vim.keymap.set('i', '<C-s>', '<esc>:w<CR>a', opts)
vim.keymap.set('i', '<C-q>', '<esc>:wq<CR>', opts)
vim.keymap.set('i', '<c-h>', '<Left>', opts)
vim.keymap.set('i', '<c-l>', '<Right>', opts)
vim.keymap.set('i', '<c-j>', '<Down>', opts)
vim.keymap.set('i', '<c-k>', '<Up>', opts)
