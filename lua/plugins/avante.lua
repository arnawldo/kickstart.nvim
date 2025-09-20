return {
  'yetone/avante.nvim',
  event = 'VeryLazy',
  lazy = false,
  version = false, -- set this if you want to always pull the latest change
  opts = {
    provider = 'claude',
    providers = {
      claude = {
        endpoint = 'https://api.anthropic.com',
        model = 'claude-3-7-sonnet-latest',
        timeout = 30000,
        extra_request_body = {
          temperature = 0.75,
          max_tokens = 4096,
        },
      },
      openai = {
        endpoint = 'https://api.openai.com/v1',
        model = 'gpt-4o',
        timeout = 30000,
        extra_request_body = {
          temperature = 0.75,
          max_tokens = 4096,
        },
      },
    },
    behaviour = {
      auto_suggestions = false, -- Start disabled for performance
      auto_set_keymaps = true,
      auto_apply_diff_after_generation = false,
      support_paste_from_clipboard = true,
      minimize_diff = true,
    },
    windows = {
      position = 'right', -- Matches your nvim-tree on left
      width = 30,
      sidebar_header = {
        enabled = true,
        align = 'center',
        rounded = true,
      },
      input = {
        prefix = '> ',
        height = 8,
      },
    },
    selector = {
      provider = 'telescope', -- Uses existing telescope setup
    },
    mappings = {
      submit = {
        normal = '<CR>',
        insert = '<C-s>', -- Matches your existing jk/kj -> save pattern
      },
    },
  },
  dependencies = {
    'stevearc/dressing.nvim',
    'nvim-lua/plenary.nvim',
    'MunifTanjim/nui.nvim',
    'nvim-tree/nvim-web-devicons',
    'saghen/blink.cmp',
    'nvim-telescope/telescope.nvim',
    {
      'HakonHarnes/img-clip.nvim',
      event = 'VeryLazy',
      opts = {
        default = {
          embed_image_as_base64 = false,
          prompt_for_file_name = false,
          drag_and_drop = {
            insert_mode = true,
          },
          use_absolute_path = true,
        },
      },
    },
    {
      'MeanderingProgrammer/render-markdown.nvim',
      opts = {
        file_types = { 'markdown', 'Avante' },
      },
      ft = { 'markdown', 'Avante' },
    },
  },
}
