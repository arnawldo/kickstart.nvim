return { -- Autoformat
  'stevearc/conform.nvim',
  event = { 'BufWritePre' },
  cmd = { 'ConformInfo' },
  keys = {
    {
      '<leader>f',
      function()
        require('conform').format { async = true, lsp_fallback = true }
      end,
      mode = '',
      desc = '[F]ormat buffer',
    },
  },
  opts = {
    notify_on_error = true,
    format_on_save = function(bufnr)
      -- Disable "format_on_save lsp_fallback" for languages that don't
      -- have a well standardized coding style. You can add additional
      -- languages here or re-enable it for the disabled ones.
      local disable_filetypes = { c = true, cpp = true }
      local lsp_format_opt
      if disable_filetypes[vim.bo[bufnr].filetype] then
        lsp_format_opt = 'never'
      else
        lsp_format_opt = 'fallback'
      end
      return {
        timeout_ms = 1000,
        lsp_format = lsp_format_opt,
      }
    end,
    stop_after_first = true,
    formatters_by_ft = {
      lua = { 'stylua' },
      -- Conform can also run multiple formatters sequentially
      python = { 'isort', 'black' },
      --
      -- You can use a sub-list to tell conform to run *until* a formatter
      -- is found.
      javascript = { 'eslint_d' },
      typescript = { 'eslint_d' },
      javascriptreact = { 'eslint_d' },
      typescriptreact = { 'eslint_d' },
      html = { 'prettier' },
      css = { 'prettier' },
      xml = { 'xmlformatter' },
      rust = { 'rustfmt' },
      sql = { 'sql_formatter' },
    },
    formatters = {
      sql_formatter = {
        -- Use the Mason-installed sql-formatter
        command = 'sql-formatter',
        -- Configure sql-formatter to use uppercase for keywords, functions, and data types
        args = {
          '--language',
          'sql',
          '--config',
          -- Inline JSON configuration for more specific control
          vim.fn.json_encode {
            keywordCase = 'upper', -- SQL keywords like SELECT, WHERE
            dataTypeCase = 'upper', -- Data types like VARCHAR, INTEGER
            functionCase = 'upper', -- Function names like COUNT, SUM
            identifierCase = 'preserve', -- Keep table and column names as is
          },
        },
      },
    },
  },
  init = function()
    -- Register formatters for dadbod query buffers
    vim.api.nvim_create_autocmd('FileType', {
      pattern = { 'dbout' },
      callback = function()
        -- Set the formatter for dbout buffers to be sql_formatter
        require('conform').formatters_by_ft.dbout = { 'sql_formatter' }
      end,
    })
  end,
}
