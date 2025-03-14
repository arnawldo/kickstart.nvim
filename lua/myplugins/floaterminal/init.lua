local M = {}

---@class Config
---@field width number Width as a percentage of editor width
---@field height number Height as a percentage of editor height
---@field border string Border style: 'none', 'single', 'double', 'rounded', 'solid', 'shadow'
---@field winblend number Window transparency (0-100)
---@field position string 'center', 'top', 'bottom', 'left', 'right'
---@field insert_on_open boolean Start in insert mode when opening terminal
---@field keymaps { toggle: { normal: string, terminal: string }, exit_insert: string, close_terminal: string|string[] } Keybinding configuration

-- Default configuration
M.config = {
  -- Window dimensions
  width = 0.8, -- Width as a percentage of editor width
  height = 0.8, -- Height as a percentage of editor height

  -- Window appearance
  border = 'rounded', -- Border style: 'none', 'single', 'double', 'rounded', 'solid', 'shadow'
  winblend = 15, -- Window transparency (0-100)

  -- Position (centered by default)
  position = 'center', -- 'center', 'top', 'bottom', 'left', 'right'

  -- Terminal behavior
  insert_on_open = true, -- Start in insert mode when opening terminal

  -- Keymaps
  keymaps = {
    toggle = {
      normal = '<Leader>T',
      terminal = '<C-T>',
    },
    exit_insert = '<esc>',
    close_terminal = { 'kj', 'jk' }, -- Key combination to close the terminal
  },
}

M.floating = { buf = -1, win = -1 }

---@class FloatOpts
---@field buf? integer # Buffer handle
---@field config? table # Override default config

---@param opts? FloatOpts
---@return { buf: integer, win: integer }
function M.open_float(opts)
  opts = opts or {}
  local config = opts.config or M.config

  -- Calculate window size based on config
  local width = math.floor(vim.o.columns * config.width)
  local height = math.floor(vim.o.lines * config.height)

  -- Calculate position based on config
  local col, row

  if config.position == 'center' then
    col = math.floor((vim.o.columns - width) / 2)
    row = math.floor((vim.o.lines - height) / 2)
  elseif config.position == 'top' then
    col = math.floor((vim.o.columns - width) / 2)
    row = math.floor(vim.o.lines * 0.1)
  elseif config.position == 'bottom' then
    col = math.floor((vim.o.columns - width) / 2)
    row = math.floor(vim.o.lines * 0.9) - height
  elseif config.position == 'left' then
    col = math.floor(vim.o.columns * 0.1)
    row = math.floor((vim.o.lines - height) / 2)
  elseif config.position == 'right' then
    col = math.floor(vim.o.columns * 0.9) - width
    row = math.floor((vim.o.lines - height) / 2)
  else
    -- Default to center if invalid position
    col = math.floor((vim.o.columns - width) / 2)
    row = math.floor((vim.o.lines - height) / 2)
  end

  -- Create a buffer if it doesn't already exist
  local buf = vim.api.nvim_buf_is_valid(opts.buf) and opts.buf or vim.api.nvim_create_buf(false, true)

  -- Configure the window
  local win_config = {
    relative = 'editor',
    width = width,
    height = height,
    col = col,
    row = row,
    style = 'minimal',
    border = config.border,
  }

  -- Open the floating window
  local win = vim.api.nvim_open_win(buf, true, win_config)

  -- Set window options
  vim.wo[win].winblend = config.winblend

  return { buf = buf, win = win }
end

function M.toggle_terminal()
  if not vim.api.nvim_win_is_valid(M.floating.win) then
    M.floating = M.open_float { buf = M.floating.buf }
    if vim.bo[M.floating.buf].buftype ~= 'terminal' then
      vim.cmd.terminal()
    end
    if M.config.insert_on_open then
      vim.cmd.startinsert()
    end
  else
    vim.api.nvim_win_hide(M.floating.win)
  end
end

---@param opts? Config
function M.setup(opts)
  -- Merge user config with defaults
  if opts then
    M.config = vim.tbl_deep_extend('force', M.config, opts)
  end

  -- Create user command
  vim.api.nvim_create_user_command('Floaterminal', M.toggle_terminal, { desc = 'Toggle floating terminal' })

  -- Set up keymaps from config
  vim.keymap.set('n', M.config.keymaps.toggle.normal, M.toggle_terminal, { desc = 'Toggle Floating Terminal' })
  vim.keymap.set('t', M.config.keymaps.toggle.terminal, M.toggle_terminal, { desc = 'Toggle Floating Terminal' })

  -- Use direct mapping for <Esc> in terminal mode
  vim.keymap.set('t', M.config.keymaps.exit_insert, '<C-\\><C-n>', { desc = 'Exit insert mode in terminal' })

  -- Add keybindings for closing the terminal with key combinations
  if type(M.config.keymaps.close_terminal) == 'table' then
    for _, key_combo in pairs(M.config.keymaps.close_terminal) do
      vim.keymap.set('t', key_combo, function()
        -- Exit terminal mode and toggle in a single operation
        vim.cmd [[
          call feedkeys("\<C-\>\<C-n>", "n")
          lua require('myplugins.floaterminal').toggle_terminal()
        ]]
      end, { desc = 'Close floating terminal' })
    end
  elseif M.config.keymaps.close_terminal then
    -- Handle the case where it's a single string
    vim.keymap.set('t', M.config.keymaps.close_terminal, function()
      -- Exit terminal mode and toggle in a single operation
      vim.cmd [[
        call feedkeys("\<C-\>\<C-n>", "n")
        lua require('myplugins.floaterminal').toggle_terminal()
      ]]
    end, { desc = 'Close floating terminal' })
  end
end

return M
