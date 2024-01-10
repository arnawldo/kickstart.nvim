-- Change the colorscheme based on time of day

local M = {} -- create the module table

-- Function to switch colorscheme / theme based on the time
function M.switch_color_scheme()
  local current_hour = tonumber(os.date '%H')
  local day_start = 8
  local day_end = 18

  if current_hour >= day_start and current_hour < day_end then
    vim.opt.background = 'light'
  else
    vim.opt.background = 'dark'
  end

  -- Gruvbox contrast
  vim.g.gruvbox_material_background = 'hard'
  -- Set gruvbox theme
  vim.cmd [[colorscheme gruvbox-material]]
end

-- Function to initialize the module
function M.init()
  M.switch_color_scheme() -- switch the colorscheme on startup

  -- Set a timer to switch the colorscheme every hour
  vim.loop.new_timer():start(
    0,
    300000,
    vim.schedule_wrap(function()
      M.switch_color_scheme()
    end)
  )
end

return M -- return the module
