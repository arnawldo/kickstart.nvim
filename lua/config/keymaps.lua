-- Keymaps Configuration Module

return function()
  -- Set highlight on search, but clear on pressing <Esc> in normal mode
  vim.opt.hlsearch = true
  vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

  vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

  -- Open init.lua
  vim.keymap.set('n', '<Leader>vr', ':e ~/.config/nvim/init.lua<CR>', { noremap = true, silent = true })

  -- Execute lua code
  vim.keymap.set('n', '<Leader>x', ':.lua<CR>')
  vim.keymap.set('v', '<Leader>x', ':lua<CR>')
  vim.keymap.set('n', '<Leader>X', function()
    if vim.bo.filetype == 'lua' then
      vim.cmd 'luafile %'
      vim.notify 'Executed current lua file'
    else
      vim.notify('Not a lua file', vim.log.levels.WARN)
    end
  end, { desc = 'Execute current lua buffer' })

  -- Source init.lua
  vim.keymap.set('n', '<Leader>S', ':source ~/.config/nvim/init.lua<CR>', { noremap = true, silent = true, desc = '[S]ource init.lua' })

  -- Open .tmux.conf
  vim.keymap.set('n', '<Leader>tm', ':e ~/.tmux.conf<CR>', { noremap = true, silent = true, desc = 'Open Tmux config' })

  -- Open .zshrc
  vim.keymap.set('n', '<Leader>zsh', ':e ~/.zshrc<CR>', { noremap = true, silent = true, desc = 'Open zsh config aka zshrc' })

  -- Exit INSERT mode by pressing jk or kj, write to file after
  vim.keymap.set('i', 'jk', '<Esc>:w<CR>', { noremap = true, silent = true, desc = 'Write buffer' })
  vim.keymap.set('i', 'kj', '<Esc>:w<CR>', { noremap = true, silent = true, desc = 'Write buffer' })

  -- Move between tabs
  vim.keymap.set('n', '<leader>tn', ':tabnew<CR>', { noremap = true, silent = true, desc = '[T]ab [N]ew' })
  vim.keymap.set('n', '<Tab>', ':tabnext<CR>', { noremap = true, silent = true, desc = '[T]ab [N]ext' })
  vim.keymap.set('n', '<S-Tab>', ':tabprevious<CR>', { noremap = true, silent = true, desc = '[P]revious [T]ab' })

  -- Remap for dealing with word wrap
  vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
  vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

  -- Diagnostic keymaps
  vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous [D]iagnostic message' })
  vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next [D]iagnostic message' })
  vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Show diagnostic [E]rror messages' })
  vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })
  vim.keymap.set('n', '<leader>Q', vim.diagnostic.setqflist, { desc = 'Open diagnostic whole [Q]uickfix list' })
  vim.keymap.set('n', '<M-j>', '<cmd>cnext<CR>')
  vim.keymap.set('n', '<M-k>', '<cmd>cprevious<CR>')
  -- TIP: Disable arrow keys in normal mode
  -- vim.keymap.set('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
  -- vim.keymap.set('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
  -- vim.keymap.set('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
  -- vim.keymap.set('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')

  -- Keybinds to make split navigation easier.
  --  Use CTRL+<hjkl> to switch between windows
  --
  --  See `:help wincmd` for a list of all window commands
  vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
  vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
  vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
  vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })
end
