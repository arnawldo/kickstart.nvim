return {
  'arnawldo/daynight',
  dir = '~/.config/nvim/lua/myplugins/daynight',
  config = function()
    require('myplugins.daynight').setup { day_start = 9, day_end = 20 }
  end,
  dependencies = {
    {
      'sainnhe/gruvbox-material',
      priority = 1000,
      config = function()
        vim.g.gruvbox_material_better_performance = 1
      end,
    },
    {
      'folke/tokyonight.nvim',
      priority = 1000,
      config = function()
        require('tokyonight').setup { style = 'storm' }
      end,
    },
  },
  event = 'VimEnter',
}
