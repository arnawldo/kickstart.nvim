-- Detect the current shell
local function get_shell_config()
  local shell = os.getenv 'SHELL'
  if shell then
    if shell:match 'zsh$' then
      return { '⚙️ Edit zshrc', 'edit ~/.zshrc', '<leader>zsh' }
    elseif shell:match 'bash$' then
      return { '⚙️ Edit bashrc', 'edit ~/.bashrc', '<leader>bash' }
    elseif shell:match 'fish$' then
      return { '⚙️ Edit fish config', 'edit ~/.config/fish/config.fish', '<leader>fish' }
    end
  end
  -- Default fallback
  return { '⚙️ Edit shell config', 'edit ~/.profile', '<leader>sh' }
end

local settings = {
  -- every line should be same width without escaped \
  header = {
    type = 'text',
    oldfiles_directory = false,
    align = 'center',
    fold_section = false,
    title = 'Header',
    margin = 5,
    content = {
      '            ⠀⠀⠀⠀⠀⠀⠀⠀⢠⡀⠀⣀⡀⠀⠀⢀⣀⣀⣤⡄⠀⠀                ',
      '            ⢶⣦⣄⣀⣀⣀⣾⣦⣿⣷⣿⣿⣷⣶⣾⣿⣿⣿⠋⠀⠀⠀                ',
      '            ⠀⠻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠏⠀⠀⠀⠀                ',
      '            ⠀⠀⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠿⠛⣿⣿⣿⣀⣤⠀⠀⠀                ',
      '            ⠀⢀⣸⣿⣿⠉⠛⡻⣿⣿⣟⣱⣀⣠⣿⣿⣿⣿⡥⠀⠀⠀                ',
      '            ⠀⠀⣻⣿⡟⣷⣶⣷⣿⠿⠿⡟⠛⢻⢡⣿⣿⣿⣷⣄⠀⠀                ',
      '            ⠀⣠⣿⣿⣷⡀⡇⠀⡇⠀⠀⡇⢀⣸⣾⣿⣿⣿⣿⣿⣧⠀                ',
      '            ⣰⣿⣿⣿⣿⣿⣷⣶⣷⣶⣶⣿⣿⣿⣿⣿⣿⣿⢿⣿⣿⡆                ',
      '            ⠻⠛⠏⢻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠀⠉⠉⠁                ',
      '            ⠀⠀⠀⣼⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⠀⠀⠀⠀                ',
      '            ⠀⠀⠀⢿⣿⣿⣿⣿⠿⣿⣿⣿⡿⠿⣿⣿⣿⡿⠀⠀⠀⠀                ',
      '            ⠀⠀⠀⠚⠛⠛⠋⠀⠀⠈⠛⠉⠀⠀⠙⠛⠛⠓⠀⠀⠀⠀                ',
      '  ███╗░░██╗███████╗░█████╗░██╗░░░██╗██╗███╗░░░███╗',
      '  ████╗░██║██╔════╝██╔══██╗██║░░░██║██║████╗░████║',
      '  ██╔██╗██║█████╗░░██║░░██║╚██╗░██╔╝██║██╔████╔██║',
      '  ██║╚████║██╔══╝░░██║░░██║░╚████╔╝░██║██║╚██╔╝██║',
      '  ██║░╚███║███████╗╚█████╔╝░░╚██╔╝░░██║██║░╚═╝░██║',
      '  ╚═╝░░╚══╝╚══════╝░╚════╝░░░░╚═╝░░░╚═╝╚═╝░░░░░╚═╝',
    },
    highlight = 'Statement',
    default_color = '',
    oldfiles_amount = 0,
  },
  -- name which will be displayed and command
  body = {
    type = 'mapping',
    oldfiles_directory = false,
    align = 'center',
    fold_section = false,
    title = 'Basic Commands',
    margin = 5,
    content = {
      { ' Find File', 'Telescope find_files', '<leader>ff' },
      { '󰍉 Find Word', 'Telescope live_grep', '<leader>sg' },
      { ' Recent Files', 'Telescope oldfiles', '<leader>s.' },
      { ' Colorschemes', 'Telescope colorscheme', '<leader>cs' },
      { ' New File', "lua require'startup'.new_file()", '<leader>nf' },
      { '⚙️ Edit init.lua', 'edit $MYVIMRC', '<leader>ei' },
      get_shell_config(),
    },
    highlight = 'String',
    default_color = '',
    oldfiles_amount = 0,
  },
  footer = {
    type = 'text',
    oldfiles_directory = false,
    align = 'center',
    fold_section = false,
    title = 'Footer',
    margin = 5,
    content = { 'startup.nvim' },
    highlight = 'Number',
    default_color = '',
    oldfiles_amount = 0,
  },

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
return settings
