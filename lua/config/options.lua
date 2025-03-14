-- Options Configuration Module

return function()
  -- Set default options
  vim.opt.number = true -- Show line numbers
  vim.opt.relativenumber = true -- Show relative line numbers
  vim.opt.mouse = 'a' -- Enable mouse for all modes
  vim.opt.showmode = false -- Don't show the mode, since it's already in status line
  vim.opt.clipboard = 'unnamedplus' -- Use system clipboard
  vim.opt.breakindent = true -- Enable break indent
  vim.opt.undofile = true -- Save undo history
  vim.opt.ignorecase = true -- Case-insensitive search
  vim.opt.smartcase = true -- Unless uppercase is used
  vim.opt.signcolumn = 'yes' -- Always show sign column
  vim.opt.updatetime = 250 -- Decrease update time
  vim.opt.timeoutlen = 300 -- Decrease timeout length
  vim.opt.splitright = true -- Split right
  vim.opt.splitbelow = true -- Split below
  vim.opt.list = true -- Show some invisible characters
  vim.opt.cursorline = true -- Highlight current line
  vim.opt.scrolloff = 10 -- Lines of context
  vim.opt.sidescrolloff = 8 -- Columns of context
  vim.opt.wrap = false -- Disable line wrap
  vim.opt.termguicolors = true -- True color support
  vim.opt.completeopt = 'menuone,noselect' -- Better completion experience
  vim.opt.expandtab = true -- Use spaces instead of tabs
  vim.opt.shiftwidth = 2 -- Size of an indent
  vim.opt.tabstop = 2 -- Number of spaces tabs count for
  vim.opt.smartindent = true -- Insert indents automatically
  vim.opt.swapfile = false -- Don't use swapfile
  vim.opt.backup = false -- Don't create backup files
  vim.opt.writebackup = false -- Don't write backup files
end
