return {
  'arnawldo/daynight',
  dir = '~/.config/nvim/lua/myplugins/daynight',
  config = function()
    require('myplugins.daynight').setup()
  end,
  dependencies = {
    'navarasu/onedark.nvim',
    'ericbn/vim-solarized',
    'sainnhe/gruvbox-material',
    'rebelot/kanagawa.nvim',
    'lifepillar/vim-solarized8',
    'folke/tokyonight.nvim',
  },
  priority = 1000,
  lazy = false,
}
