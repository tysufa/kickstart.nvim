vim.keymap.set('n', '<C-p>', function()
  local input = vim.fn.input 'command to run : '
  print(input)
end, {})
