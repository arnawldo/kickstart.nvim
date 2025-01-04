return {
  dir = '~/.config/nvim/lua/myplugins/options/',
  lazy = false,
  priority = 10000,
  config = function()
    require('myplugins.options').setup()
  end,
}
