return function()
  -- UI Options
  vim.opt.number = true -- Show line numbers
  vim.opt.relativenumber = false -- Don't show relative line numbers
  vim.opt.showmode = false -- Don't show the mode, since it's already in status line
  vim.opt.signcolumn = 'yes' -- Always show sign column
  vim.opt.cursorline = true -- Highlight current line
  vim.opt.termguicolors = true -- True color support
  vim.opt.wrap = false -- Disable line wrap

  -- Scrolling
  vim.opt.scrolloff = 10 -- Lines of context
  vim.opt.sidescrolloff = 8 -- Columns of context

  -- Mouse and Clipboard
  vim.opt.mouse = 'a' -- Enable mouse for all modes
  -- Sync clipboard between OS and Neovim (scheduled to improve startup time)
  vim.schedule(function()
    vim.opt.clipboard = 'unnamedplus'
  end)

  -- Indentation and Tabs
  vim.opt.expandtab = true -- Use spaces instead of tabs
  vim.opt.shiftwidth = 2 -- Size of an indent
  vim.opt.tabstop = 2 -- Number of spaces tabs count for
  vim.opt.smartindent = true -- Insert indents automatically
  vim.opt.breakindent = true -- Enable break indent

  -- Search
  vim.opt.ignorecase = true -- Case-insensitive search
  vim.opt.smartcase = true -- Unless uppercase is used
  vim.opt.inccommand = 'split' -- Preview substitutions live

  -- Splits
  vim.opt.splitright = true -- Split right
  vim.opt.splitbelow = true -- Split below

  -- Timing
  vim.opt.updatetime = 250 -- Decrease update time
  vim.opt.timeoutlen = 300 -- Decrease timeout length

  -- File Handling
  vim.opt.undofile = true -- Save undo history
  vim.opt.swapfile = false -- Don't use swapfile
  vim.opt.backup = false -- Don't create backup files
  vim.opt.writebackup = false -- Don't write backup files
  vim.opt.autoread = true -- Automatically reload files changed outside of Neovim
  vim.opt.autowriteall = true -- Automatically save files when switching buffers or leaving them

  -- Completion
  vim.opt.completeopt = 'menuone,noselect' -- Better completion experience

  -- Whitespace Characters
  vim.opt.list = true -- Show some invisible characters
  vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }
end
