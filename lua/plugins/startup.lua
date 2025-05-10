-- Startup screen
--

-- TODO
-- 1 Custom Theme: You could create a personalized theme instead of using the default 'dashboard' theme.
-- 2 Frequently Used Files: Configure it to show your recently opened files or projects.
-- 3 Quick Actions: Add custom buttons for common actions like opening your config files, checking git status, etc.
-- 4 Visual Enhancements: Add ASCII art, quotes, or other visual elements to make your dashboard more engaging.
-- 5 Integration with Other Plugins: Better integrate with your other plugins like nvim-tree or telescope for quick access.
-- 6 Session Management: Add session management capabilities to quickly resume previous work.
return {
  'startup-nvim/startup.nvim',
  dependencies = { 'nvim-telescope/telescope.nvim', 'nvim-lua/plenary.nvim', 'nvim-telescope/telescope-file-browser.nvim' },
  config = function()
    require('startup').setup(require 'config.dashboard')
  end,
}
