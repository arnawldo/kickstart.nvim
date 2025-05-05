-- Revamp UI for messages, cmdline, popupmenu
return {
  'folke/noice.nvim',
  event = 'VeryLazy',
  opts = {
    -- add any options here
  },
  dependencies = {
    -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
    'MunifTanjim/nui.nvim',
    -- OPTIONAL:
    --   `nvim-notify` is only needed, if you want to use the notification view.
    --   If not available, we use `mini` as the fallback
    'rcarriga/nvim-notify',
  },
  config = function()
    require('noice').setup {
      lsp = {
        -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
        override = {
          ['vim.lsp.util.convert_input_to_markdown_lines'] = true,
          ['vim.lsp.util.stylize_markdown'] = true,
          ['cmp.entry.get_documentation'] = true, -- requires hrsh7th/nvim-cmp
        },
      },
      -- you can enable a preset for easier configuration
      presets = {
        bottom_search = true, -- use a classic bottom cmdline for search
        command_palette = true, -- position the cmdline and popupmenu together
        long_message_to_split = true, -- long messages will be sent to a split
        inc_rename = false, -- enables an input dialog for inc-rename.nvim
        lsp_doc_border = false, -- add a border to hover docs and signature help
      },
      -- Configure routes to use different views based on the buffer filetype
      routes = {
        {
          -- Use default vim message rendering for DBUI buffers
          filter = {
            event = 'msg_show',
            find = '.*', -- Match any message
            cond = function()
              -- Check if current buffer is a DBUI buffer
              local buf_ft = vim.bo.filetype
              return buf_ft == 'dbui' or buf_ft == 'dbout' or buf_ft == 'sql'
            end,
          },
          opts = { skip = true }, -- Skip noice handling, use vim's default
        },
      },
    }
    vim.keymap.set('n', '<leader>nd', function()
      require('noice').cmd 'dismiss'
    end, { desc = '[N]oice [D]ismiss' })
  end,
}
