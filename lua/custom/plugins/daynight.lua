-- My colorscheme plugin

return {
  dir = '~/.config/nvim/plugged/daynight',
  name = 'My Custom Theme Setup',
  lazy = false,
  priority = 1000,
  dependencies = {
    'navarasu/onedark.nvim',
    'ericbn/vim-solarized',
    'sainnhe/gruvbox-material',
    'rebelot/kanagawa.nvim',
    'lifepillar/vim-solarized8',
  },
  init = function()
    require('daynight').init()
  end,
}
