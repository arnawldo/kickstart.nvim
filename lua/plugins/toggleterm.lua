return {
  'akinsho/toggleterm.nvim',
  version = '*',
  config = function()
    local set_terminal_keymaps = function()
      local opts = { buffer = 0 }
      -- Change to normal mode is
      vim.keymap.set('t', '<esc>', [[<C-\><C-n>]], opts)
      vim.keymap.set('t', 'jk', [[<C-\><C-n>]], opts)
      -- vim.keymap.set('t', '<C-h>', [[<Cmd>wincmd h<CR>]], opts)
      -- vim.keymap.set('t', '<C-j>', [[<Cmd>wincmd j<CR>]], opts)
      -- vim.keymap.set('t', '<C-k>', [[<Cmd>wincmd k<CR>]], opts)
      -- vim.keymap.set('t', '<C-l>', [[<Cmd>wincmd l<CR>]], opts)
      -- vim.keymap.set('t', '<C-w>', [[<C-\><C-n><C-w>]], opts)
    end

    -- Create an autocmd group for terminal keymaps
    local term_group = vim.api.nvim_create_augroup('TerminalKeymaps', { clear = true })

    -- Set up the autocmd for terminal keymaps using the Lua API
    vim.api.nvim_create_autocmd('TermOpen', {
      group = term_group,
      pattern = 'term://*',
      callback = set_terminal_keymaps,
      desc = 'Set terminal keymaps when a terminal is opened',
    })

    -- Configure toggleterm
    require('toggleterm').setup {
      open_mapping = [[<leader>T]],
      direction = 'tab',
      name = 'term',
    }

    -- Set up lazygit terminal
    local Terminal = require('toggleterm.terminal').Terminal
    local lazygit = Terminal:new {
      cmd = 'lazygit',
      display_name = 'lazygit',
      direction = 'tab',
      hidden = true,
      on_open = function(term)
        -- Remove the jk mapping in this terminal buffer
        -- to avoid conflict with LazyGit
        vim.keymap.del('t', 'jk', { buffer = term.bufnr })
        -- Remove the <esc> mapping in this terminal buffer
        vim.keymap.del('t', '<esc>', { buffer = term.bufnr })
      end,
    }

    function lazygit_toggle()
      lazygit:toggle()
    end

    vim.keymap.set('n', '<leader>lg', lazygit_toggle, { noremap = true, silent = true })
  end,
}
