-- Expand 'cc' into 'CodeCompanion' in the command line
vim.cmd [[cab cc CodeCompanion]]

return {
  'olimorris/codecompanion.nvim',
  opts = {
    strategies = {
      chat = {
        adapter = 'anthropic',
        model = 'claude-sonnet-4-20250514',
        max_tokens = 4000,
      },
    },
    -- NOTE: The log_level is in `opts.opts`
    opts = {
      log_level = 'DEBUG',
    },
  },
  dependencies = {
    'nvim-lua/plenary.nvim',
    'ravitemer/mcphub.nvim',
  },
}
