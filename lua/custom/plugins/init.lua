-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
  {
    'norcalli/nvim-colorizer.lua',
    config = function()
      require('colorizer').setup()
    end,
  },
  { 'catppuccin/nvim', name = 'catppuccin', priority = 1000 },
  { 'mbbill/undotree' },
  { 'ThePrimeagen/harpoon', dependencies = { 'nvim-lua/plenary.nvim' } },
  { 'windwp/nvim-autopairs', event = 'InsertEnter', config = true },
  {
    'stevearc/oil.nvim',
    opts = {},
    -- Optional dependencies
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      require('oil').setup()
    end,
  },
  {
    'startup-nvim/startup.nvim',
    requires = { 'nvim-telescope/telescope.nvim', 'nvim-lua/plenary.nvim' },
    config = function()
      require('startup').setup(require 'custom.plugins.advanceConfigs.startup')
    end,
  },

  {
    'nvim-tree/nvim-tree.lua',
    version = '*',
    lazy = false,
    dependencies = {
      'nvim-tree/nvim-web-devicons',
    },
  },
  -- {
  --   'nvim-lualine/lualine.nvim',
  --   dependencies = { 'nvim-tree/nvim-web-devicons' },
  -- },
  -- {
  --   'mfussenegger/nvim-dap',
  -- },

  -- {
  --   'leoluz/nvim-dap-go',
  --   ft = 'go',
  --   dependencies = 'mfussenegger/nvim-dap',
  --   config = function(_, opts)
  --     require('dap-go').setup(opts)
  --   end,
  -- },
}
