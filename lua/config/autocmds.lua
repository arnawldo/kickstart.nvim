-- Autocommands Configuration Module

return function()
  -- Highlight on yank
  vim.api.nvim_create_autocmd('TextYankPost', {
    desc = 'Highlight when yanking (copying) text',
    group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
    callback = function()
      vim.highlight.on_yank()
    end,
  })

  -- Auto-resize splits when Neovim is resized
  vim.api.nvim_create_autocmd('VimResized', {
    desc = 'Auto-resize splits on window resize',
    group = vim.api.nvim_create_augroup('auto_resize_splits', { clear = true }),
    callback = function()
      vim.cmd 'wincmd ='
    end,
  })

  -- Return to last edit position when opening files
  vim.api.nvim_create_autocmd('BufReadPost', {
    desc = 'Return to last edit position when opening files',
    group = vim.api.nvim_create_augroup('last_edit_position', { clear = true }),
    callback = function()
      local mark = vim.api.nvim_buf_get_mark(0, '"')
      local lcount = vim.api.nvim_buf_line_count(0)
      if mark[1] > 0 and mark[1] <= lcount then
        pcall(vim.api.nvim_win_set_cursor, 0, mark)
      end
    end,
  })

  -- Add autocommand for more frequent file change checks
  vim.api.nvim_create_autocmd({ 'FocusGained', 'BufEnter', 'CursorHold', 'CursorHoldI' }, {
    group = vim.api.nvim_create_augroup('auto_checktime', { clear = true }),
    pattern = '*', -- Apply to all files
    desc = 'Check for file changes on disk more frequently',
    callback = function()
      -- Only check for buffers that are listed, modifiable, and have a filename
      if vim.bo.buflisted and vim.bo.modifiable and vim.fn.filereadable(vim.api.nvim_buf_get_name(0)) == 1 then
        -- Use 'checktime' command which respects the 'autoread' option
        vim.cmd 'checktime'
      end
    end,
  })
end
