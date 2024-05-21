-- GitHub Copilot
return {
  'zbirenbaum/copilot.lua',
  cmd = 'Copilot',
  event = 'InsertEnter',
  config = function()
    require('copilot').setup {
      filetypes = {
        -- disable for all
        -- python = true,
        -- lua = true,
        -- java = true,
        -- c = true,
        -- elixirls = true,
        -- html = true,
        -- javascript = true,
        -- typescript = true,
        -- typescriptreact = true,
        ['*'] = false, -- disable for all other filetypes and ignore default `filetypes`
      },
    }
  end,
}
