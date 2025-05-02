return {
  -- Seamlessly move between tmux panes and vim splits
  'christoomey/vim-tmux-navigator',
  config = function()
    -- Disable the default mappings
    vim.g.tmux_navigator_no_mappings = 1

    -- Define custom mappings
    vim.keymap.set('n', '<C-h>', '<cmd>TmuxNavigateLeft<CR>', { silent = true, desc = 'Navigate to left pane' })
    vim.keymap.set('n', '<C-j>', '<cmd>TmuxNavigateDown<CR>', { silent = true, desc = 'Navigate to down pane' })
    vim.keymap.set('n', '<C-k>', '<cmd>TmuxNavigateUp<CR>', { silent = true, desc = 'Navigate to up pane' })
    vim.keymap.set('n', '<C-l>', '<cmd>TmuxNavigateRight<CR>', { silent = true, desc = 'Navigate to right pane' })
    -- vim.keymap.set('n', '<C-\\>', '<cmd>TmuxNavigatePrevious<CR>', { silent = true, desc = 'Navigate to previous pane' })
  end,
}
