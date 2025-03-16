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
  dependencies = { 'nvim-telescope/telescope.nvim', 'nvim-lua/plenary.nvim' },
  config = function()
    local startup = require 'startup'

    -- Custom theme with ASCII art
    local custom_theme = {
      header = {
        type = 'text',
        align = 'center',
        fold_section = false,
        title = 'header',
        margin = 5,
        content = {
          '⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⠢⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀',
          '⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⡄⠀⠀⢀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀',
          '⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⣷⡀⠀⠀⠑⢄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀',
          '⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⣿⣧⠀⠀⠀⠀⠑⢄⠀⠀⠀⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⡠⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀',
          '⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⣿⣿⣇⠀⠀⠀⠀⠀⠑⢄⣰⠉⠢⣀⠐⡀⢀⣀⠤⠐⠂⠉⠀⡼⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀',
          '⠀⠀⢠⣀⠀⠀⠀⠀⠀⠀⠀⣿⣿⣿⣆⠀⠀⠀⠀⠀⠀⠙⠀⠀⠈⠀⠈⠁⠀⠀⠀⠀⠀⣼⠁⠀⣀⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀',
          '⢴⣶⣾⣿⡟⠲⢤⣀⠀⠀⠀⣿⣿⣿⣿⠇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢨⣟⣁⣀⣀⣀⣀⣀⣀⣀⣀⡀⠀⠀⠀⠀⠀⢀⠀',
          '⠀⣨⣿⣿⣷⣄⠀⠈⠑⠢⠄⠛⠛⠿⠧⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣠⣤⠞⠁',
          '⠈⠉⠻⣿⣿⣿⣷⣄⠀⣤⣤⣤⣶⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⣶⣿⡷⠂⠀⠀⠀⠀⢀⣀⣤⣶⣿⡿⠟⠁⠀⠀',
          '⠀⠀⠀⠈⢿⣿⣿⣿⣧⣿⣿⣿⡟⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⣴⣿⣿⣿⣿⠞⠁⣀⣤⣴⣾⣿⣿⣿⡿⠋⠀⠀⠀⠀⠀',
          '⠀⠀⠀⠀⠘⣿⣿⣿⣿⣿⣿⣿⣿⣷⣶⠆⢃⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣀⣴⣿⣿⣿⣿⣿⣿⣷⣾⣿⣿⣿⣿⣿⣿⠟⠉⠀⠀⠀⠀⠀⠀⠀',
          '⠀⠀⠀⠀⠀⠘⣿⣿⣿⣿⣿⣿⣿⣿⡏⠀⠀⢆⠀⠀⢀⠀⠀⠀⠀⠀⠀⠀⣨⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠟⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀',
          '⠀⠀⠀⠀⠀⠀⣿⣿⣿⣿⣿⣿⣿⣿⡀⠀⠀⢈⣶⣶⣾⣿⣦⣤⠄⠀⠀⢠⣿⣿⣿⡿⠟⢻⣿⣿⣿⣿⣿⣿⣿⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀',
          '⠀⠀⠀⠀⠀⣸⣿⣿⣿⣿⣿⡿⣿⣿⣷⣄⠀⠀⠘⣿⣿⣿⣿⣿⣿⣁⣴⣿⡿⠟⠉⠀⠀⣿⣿⣿⣿⣿⣿⣿⣿⠒⠒⠒⠤⠤⠤⠀⢀⣀⡀⠀⠀⠀',
          '⠀⠀⠀⠀⠀⣿⣿⣿⣿⣿⣿⡇⠈⢻⣿⣿⣿⣶⣶⣿⣿⣿⣿⣿⣿⡿⠛⠙⠃⠀⠀⠀⢠⣿⣿⣿⣿⣿⣿⣿⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠷⣀⠀⠀',
          '⠀⠀⠀⠀⠀⣿⣿⣿⣿⣿⣿⡇⠀⡸⠉⠻⢿⣿⣿⣿⣿⣿⣿⣿⣿⣷⣤⣄⣀⣀⣠⣴⣿⣿⣿⣿⣿⣿⣿⣥⣤⣀⠀⠀⠀⠀⠀⠀⠀⣀⡌⠁⠀⠀',
          '⠀⠀⠀⠀⠀⣿⣿⣿⣿⣿⣿⣷⡀⡇⠀⠀⠀⡸⠙⠻⠿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣟⠋⠁⠀⣀⣠⡤⠖⠚⠉⠉⠁⠀⠀⠀',
          '⠀⠀⠀⠀⠀⣿⣿⣿⣿⣿⣿⣿⣿⣦⡀⠀⢀⠃⠀⠀⠀⠀⠀⢩⠉⠉⠉⠉⢻⠉⠉⣩⣿⣿⣿⣿⣿⣿⣿⣿⡷⠾⠛⠉⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀',
          '⠀⠀⠀⠀⣼⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣶⣜⡀⠀⠀⠀⠀⠀⡘⠀⠀⠀⠀⣼⣠⣾⣿⣿⣿⣿⣿⣿⣿⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀',
          '⠀⠀⠀⢸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣶⣦⣤⣤⣇⣀⣀⣤⣴⣿⣿⣿⣿⣿⣿⣿⣿⣿⠏⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀',
          '⠀⠀⠀⢸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀',
          '⠀⠀⠀⠈⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀',
          '⠀⠀⠀⠀⠀⠙⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡆⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀',
          '⠀⠀⠀⠀⠀⠀⠀⠸⣿⣿⣿⣿⠉⠙⠿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀',
          '⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠃⠀⠀⠀⠀⠀⠉⠻⣿⣿⣿⣿⠿⠿⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠃⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀',
          '⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠻⣿⠏⠀⠀⠈⢿⣿⣿⣿⣿⣿⣿⣿⣿⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀',
          '⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⢿⣿⣿⣿⣿⣿⠟⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀',
          '⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠻⠿⠟⠋⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀',
        },
        highlight = 'Statement',
        default_color = '',
        oldfiles_amount = 0,
      },
      body = {
        type = 'mapping',
        align = 'center',
        fold_section = false,
        title = 'Quick Actions',
        margin = 5,
        content = {
          { ' Find File', 'Telescope find_files', '<leader>ff' },
          { ' Recent Files', 'Telescope oldfiles', '<leader>fo' },
          { ' Find Word', 'Telescope live_grep', '<leader>fg' },
          { ' File Browser', 'NvimTreeToggle', '<leader>nt' },
          { ' Configuration', 'edit $MYVIMRC', '<leader>rc' },
        },
        highlight = 'String',
        default_color = '',
        oldfiles_amount = 0,
      },
      footer = {
        type = 'text',
        align = 'center',
        fold_section = false,
        title = 'footer',
        margin = 5,
        content = function()
          local stats = require('lazy').stats()
          local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
          return { 'Neovim loaded ' .. stats.count .. ' plugins in ' .. ms .. 'ms' }
        end,
        highlight = 'Number',
        default_color = '',
        oldfiles_amount = 0,
      },
    }

    startup.setup {
      theme = custom_theme,
      options = {
        mapping_keys = true,
        cursor_column = 0.5,
        empty_lines_between_mappings = true,
        disable_statuslines = true,
        paddings = { 1, 3, 3, 0 },
      },
      mappings = {
        execute_command = '<CR>',
        open_file = 'o',
        open_file_split = '<c-o>',
        open_section = '<TAB>',
        open_help = '?',
      },
      colors = {
        background = '#1f2227',
        folded_section = '#56b6c2',
      },
      parts = { 'header', 'body', 'footer' },
    }
  end,
}
