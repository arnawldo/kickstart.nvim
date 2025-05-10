return {
  'tpope/vim-fugitive',
  config = function()
    vim.keymap.set('n', '<leader>G', ':Git<CR>', { desc = '[G]it status' })
  end,
}
