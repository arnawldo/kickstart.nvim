# Floating Terminal for Neovim

A lightweight floating terminal implementation for Neovim that provides a toggleable terminal window with customizable appearance and behavior.

## Features

- Toggle a floating terminal window with customizable keybindings
- Configure window dimensions, position, and appearance
- Automatically enter insert mode when opening the terminal
- Preserve terminal state between toggles
- Customizable border styles and transparency

## Installation

Include this plugin in your Neovim configuration:

```lua
-- Using lazy.nvim
{
  'your-username/kickstart.nvim',
  config = function()
    require('myplugins.floaterminal').setup()
  end,
}
```

## Configuration

The floating terminal can be configured with the following options:

```lua
require('myplugins.floaterminal').setup({
  -- Window dimensions (as percentage of editor size)
  width = 0.8,
  height = 0.8,

  -- Window appearance
  border = 'rounded', -- 'none', 'single', 'double', 'rounded', 'solid', 'shadow'
  winblend = 15,      -- Window transparency (0-100)

  -- Position
  position = 'center', -- 'center', 'top', 'bottom', 'left', 'right'

  -- Terminal behavior
  insert_on_open = true, -- Start in insert mode when opening terminal

  -- Keymaps
  keymaps = {
    toggle = {
      normal = '<Leader>T',  -- Toggle terminal in normal mode
      terminal = '<C-T>',    -- Toggle terminal in terminal mode
    },
    exit_insert = '<esc>',   -- Exit insert mode in terminal
  },
})
```

## Usage

### Commands

- `:Floaterminal` - Toggle the floating terminal window

### Default Keybindings

- `<Leader>T` - Toggle terminal from normal mode
- `<C-T>` - Toggle terminal from terminal mode (hide the terminal)
- `<Esc>` - Exit insert mode in terminal

## API

The plugin provides the following functions for programmatic use:

### `setup(opts)`

Initialize the floating terminal with custom options.

```lua
require('myplugins.floaterminal').setup({
  width = 0.9,
  height = 0.8,
  position = 'bottom',
})
```

### `toggle_terminal()`

Programmatically toggle the terminal window.

```lua
require('myplugins.floaterminal').toggle_terminal()
```

### `open_float(opts)`

Open a floating window with custom options.

```lua
local float = require('myplugins.floaterminal').open_float({
  buf = existing_buf, -- Optional: use existing buffer
  config = {          -- Optional: override default config
    width = 0.5,
    height = 0.5,
    position = 'top',
  }
})
-- Returns { buf = buffer_id, win = window_id }
```

## Planned Improvements

Future enhancements for the floating terminal include:

1. Support for multiple terminal instances
2. Terminal buffer lifecycle management
3. Terminal history navigation
4. Project directory detection
5. Session persistence
6. Enhanced border styling options
7. Terminal presets for different tasks
8. Auto-close functionality
9. Focus control options
10. Resize functionality after creation
