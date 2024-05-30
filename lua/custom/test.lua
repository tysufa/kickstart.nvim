vim.keymap.set('n', '<C-p>', function()
  local input = vim.fn.input 'command to run : '
  require('noice').redirect(function()
    vim.cmd('!' .. input)
  end)
end, {})
