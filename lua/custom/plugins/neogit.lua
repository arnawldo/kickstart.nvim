-- For Git
return {
  'NeogitOrg/neogit',
  -- commit = 'eca97dbbb964d0de1e17a21525d4f895669b1b2f',
  tag = 'v0.0.1',
  dependencies = {
    'nvim-lua/plenary.nvim', -- required
    'sindrets/diffview.nvim', -- optional - Diff integration

    -- Only one of these is needed, not both.
    'nvim-telescope/telescope.nvim', -- optional
    -- 'ibhagwan/fzf-lua', -- optional
  },
  config = true,
  init = function()
    vim.keymap.set('n', '<leader>ng', ':Neogit<CR>', { desc = '[N]eo[G]it' })
  end,
}
