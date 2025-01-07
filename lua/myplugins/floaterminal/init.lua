local M = {}

M.floating = { buf = -1, win = -1 }

---@class FloatOpts
---@field buf? integer # Buffer handle

---@param opts? FloatOpts
---@return { buf: integer, win: integer }
function M.open_float(opts)
  opts = opts or {}
  -- Calculate window size (80% of editor dimensions)
  local width = math.floor(vim.o.columns * 0.8)
  local height = math.floor(vim.o.lines * 0.8)

  -- Calculate position (centered)
  local col = math.floor((vim.o.columns - width) / 2)
  local row = math.floor((vim.o.lines - height) / 2)

  -- Create a buffer if it doesn't already exist
  local buf = nil
  if vim.api.nvim_buf_is_valid(opts.buf) then
    buf = opts.buf
  else
    buf = vim.api.nvim_create_buf(false, true)
  end

  -- Configure the window
  local win_config = {
    relative = 'editor',
    width = width,
    height = height,
    col = col,
    row = row,
    style = 'minimal',
    border = 'rounded',
  }

  -- Open the floating window
  local win = vim.api.nvim_open_win(buf, true, win_config)

  -- Set window options
  vim.wo[win].winblend = 15 -- slight transparency

  return { buf = buf, win = win }
end

function M.toggle_terminal()
  if not vim.api.nvim_win_is_valid(M.floating.win) then
    M.floating = M.open_float { buf = M.floating.buf }
    if vim.bo[M.floating.buf].buftype ~= 'terminal' then
      vim.cmd.terminal()
    end
    vim.cmd.startinsert()
  else
    vim.api.nvim_win_hide(M.floating.win)
  end
end

function M.setup(_)
  vim.api.nvim_create_user_command('Floaterminal', M.toggle_terminal, { desc = 'Toggle floating terminal' })

  vim.keymap.set({ 'n', 't' }, '<Leader>T', M.toggle_terminal, { desc = 'Toggle Floating [T]erminal' })
  vim.keymap.set('t', '<C-T>', M.toggle_terminal, { desc = 'Toggle Floating [T]erminal' })
  vim.keymap.set('t', '<esc>', vim.cmd.stopinsert, { desc = 'Exit insert mode in terminal' })
end

return M
