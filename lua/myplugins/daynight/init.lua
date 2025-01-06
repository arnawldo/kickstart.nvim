---@class DayNightConfig
---@field day_start number Hour to start day mode (0-23)
---@field day_end number Hour to end day mode (0-23)
---@field check_interval number Interval in ms to check time (default: 300000)

local M = {}

---@type DayNightConfig
M.config = {
  day_start = 8,
  day_end = 18,
  check_interval = 300000,
}

---Update colorscheme based on time of day
---@private
function M._update_theme()
  local current_hour = tonumber(os.date '%H')
  local is_daytime = current_hour >= M.config.day_start and current_hour < M.config.day_end

  -- Set background based on time
  vim.opt.background = is_daytime and 'light' or 'dark'

  pcall(vim.cmd.colorscheme, 'gruvbox-material')
end

---Setup the daynight plugin
---@param opts? DayNightConfig
function M.setup(opts)
  -- Merge user config with defaults
  M.config = vim.tbl_deep_extend('force', M.config, opts or {})

  -- Initial theme update
  M._update_theme()

  -- Create autogroup for the plugin
  local group = vim.api.nvim_create_augroup('DayNight', { clear = true })

  -- Setup timer for theme updates
  vim.api.nvim_create_autocmd('VimEnter', {
    group = group,
    callback = function()
      local timer = vim.loop.new_timer()
      timer:start(
        0,
        M.config.check_interval,
        vim.schedule_wrap(function()
          M._update_theme()
        end)
      )
    end,
  })
end

return M
