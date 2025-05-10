-- Code Folding
--
return {
  'kevinhwang91/nvim-ufo',
  dependencies = {
    'kevinhwang91/promise-async',
    'nvim-treesitter/nvim-treesitter',
    'neovim/nvim-lspconfig',
  },
  config = function()
    -- Basic fold settings
    vim.o.foldcolumn = '1' -- Show fold column
    vim.o.foldlevel = 99 -- Don't close folds by default
    vim.o.foldlevelstart = 99 -- Start with all folds open
    vim.o.foldenable = true -- Enable folding

    -- Enhanced keymaps for folding
    vim.keymap.set('n', 'zR', require('ufo').openAllFolds, { desc = 'Open all folds' })
    vim.keymap.set('n', 'zM', require('ufo').closeAllFolds, { desc = 'Close all folds' })
    vim.keymap.set('n', 'zr', require('ufo').openFoldsExceptKinds, { desc = 'Open folds except kinds' })
    vim.keymap.set('n', 'zm', require('ufo').closeFoldsWith, { desc = 'Close folds with' })
    vim.keymap.set('n', 'zp', require('ufo').peekFoldedLinesUnderCursor, { desc = 'Peek folded lines' })

    -- Create fold preview handler
    local handler = function(virtText, lnum, endLnum, width, truncate)
      local newVirtText = {}
      local suffix = (' 󰁂 %d lines'):format(endLnum - lnum)
      local sufWidth = vim.fn.strdisplaywidth(suffix)
      local targetWidth = width - sufWidth
      local curWidth = 0

      for _, chunk in ipairs(virtText) do
        local chunkText = chunk[1]
        local chunkWidth = vim.fn.strdisplaywidth(chunkText)

        if targetWidth > curWidth + chunkWidth then
          table.insert(newVirtText, chunk)
        else
          chunkText = truncate(chunkText, targetWidth - curWidth)
          local hlGroup = chunk[2]
          table.insert(newVirtText, { chunkText, hlGroup })
          chunkWidth = vim.fn.strdisplaywidth(chunkText)
          -- str width returned from truncate() may less than 2nd argument, need padding
          if curWidth + chunkWidth < targetWidth then
            suffix = suffix .. (' '):rep(targetWidth - curWidth - chunkWidth)
          end
          break
        end
        curWidth = curWidth + chunkWidth
      end

      table.insert(newVirtText, { suffix, 'MoreMsg' })
      return newVirtText
    end

    -- Configure UFO
    require('ufo').setup {
      open_fold_hl_timeout = 150,
      provider_selector = function(bufnr, filetype, buftype)
        -- Use treesitter as primary provider when available
        local language_parsers = {
          'bash',
          'c',
          'cpp',
          'go',
          'javascript',
          'json',
          'lua',
          'python',
          'rust',
          'typescript',
          'vim',
          'yaml',
        }

        -- Check if current filetype has treesitter parser
        -- Use vim.tbl_contains for more efficient lookup
        if vim.tbl_contains(language_parsers, filetype) then
          return { 'treesitter', 'indent' }
        else
          return { 'indent' }
        end
      end,
      fold_virt_text_handler = handler,
      preview = {
        win_config = {
          border = 'rounded',
          winhighlight = 'Normal:Folded',
          winblend = 0,
        },
        mappings = {
          scrollU = '<C-u>',
          scrollD = '<C-d>',
          jumpTop = '[',
          jumpBot = ']',
        },
      },
    }

    -- Highlight folded lines with a subtle background color
    vim.api.nvim_set_hl(0, 'Folded', { bg = '#2d3149', fg = '#7aa2f7' })
    vim.api.nvim_set_hl(0, 'FoldColumn', { bg = 'NONE', fg = '#565f89' })

    -- Function to get fold info for statusline
    -- Usage in statusline: require('ufo').getFoldInfo()
    local ufo = require 'ufo'
    function ufo.getFoldInfo()
      local fold_info = ufo.getFoldInfo()
      if fold_info.folded == 0 then
        return ''
      else
        return string.format(' 󰁂 %d/%d ', fold_info.folded, fold_info.foldable)
      end
    end
  end,
}
