return {
  'akinsho/toggleterm.nvim',
  version = '*',
  config = function()
    local set_terminal_keymaps = function()
      local opts = { buffer = 0 }
      -- Change to normal mode with jk or <ESC>
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
      direction = 'float',
      name = 'term',
      float_opts = {
        border = 'double',
        winblend = 10,
      },
    }

    -- Set up lazygit and lazydocker terminal
    local Terminal = require('toggleterm.terminal').Terminal
    local function on_open_custom_term(term)
      -- Remove the jk mapping in this terminal buffer
      -- to avoid conflict with running program e.g lazygit
      vim.keymap.del('t', 'jk', { buffer = term.bufnr })
      -- Remove the <esc> mapping in this terminal buffer
      -- Sends straight to running program
      vim.keymap.del('t', '<esc>', { buffer = term.bufnr })
    end

    local lazydocker = Terminal:new {
      cmd = 'lazydocker',
      display_name = 'lazydocker',
      direction = 'float',
      hidden = true,
      on_open = on_open_custom_term,
    }

    local lazygit = Terminal:new {
      cmd = 'lazygit',
      display_name = 'lazygit',
      direction = 'float',
      hidden = true,
      on_open = on_open_custom_term,
    }

    local function lazygit_toggle()
      lazygit:toggle()
    end
    local function lazydocker_toggle()
      lazydocker:toggle()
    end

    vim.keymap.set('n', '<leader>lg', lazygit_toggle, { noremap = true, silent = true })
    vim.keymap.set('n', '<leader>ld', lazydocker_toggle, { noremap = true, silent = true })
  end,
}
