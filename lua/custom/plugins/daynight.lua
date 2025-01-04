return {
  'arnawldo/daynight',
  dir = '~/.config/nvim/lua/myplugins/daynight',
  config = function()
    require('myplugins.daynight').setup {
      light_theme = 'gruvbox-material',
      dark_theme = 'tokyonight-storm',
    }
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
