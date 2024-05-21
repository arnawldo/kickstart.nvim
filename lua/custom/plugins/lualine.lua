-- Set lualine as statusline
-- See `:help lualine.txt`

return {
  'nvim-lualine/lualine.nvim',
  opts = {
    options = {
      icons_enabled = true,
      theme = 'auto',
      component_separators = { left = '', right = '' },
      section_separators = { left = '', right = '' },
    },
    sections = {
      lualine_x = { 'copilot', 'encoding', 'fileformat', 'filetype' }, -- I added copilot here
    },
  },
}
