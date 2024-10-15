# My Neovim Configuration

My personal (and highly opinionated) configuration for [Neovim](https://neovim.io/).

This configuration was designed to be extensible so that I can use it in any 
context (e.g. personal projects, work). This configuration uses [lazy.nvim](https://github.com/folke/lazy.nvim) for 
plugin management.

## Setup

Clone this repository into `$HOME/.config/nvim`:

```sh
git clone --depth 1 https://github.com/kevhlee/nvim.git $HOME/.config/nvim
```

## Configuration

This Neovim configuration has the following structure:

```bash
.
├── init.lua         # Entry point
└── lua
    ├── globals.lua  # Sets global variables (i.e. `vim.g`)
    ├── keymaps.lua  # Sets general key mappings
    ├── options.lua  # Sets option variables (i.e. `vim.o`)
    └── plugins/     # Contains plugin configurations
```

To add/override configurations in `lua/globals.lua`, `lua/keymaps.lua`, or 
`lua/options.lua`, simply create a file with the same name in the `lua/custom` 
directory that returns a table containing the overrides:

Example:

```lua
-- In `lua/custom/globals.lua`

return {
    mapleader = " ",
    maplocalleader = " ",
    netrw_banner = false,
}

-- In `lua/custom/keymaps.lua

return {
    {
        mode = "n",
        lhs = "<C-n>",
        rhs = "<cmd>Explore<cr>",
        opts = {
            desc = "Open file browser",
        },
    },
    {
        mode = { "n", "v" },
        lhs = "<leader>tt",
        rhs = function()
            print("Hello, world")
        end,
        opts = {
            buffer = true,
            noremap = false,
        },
    },
}

-- In `lua/custom/options.lua`

return {
    background = "dark",
    termguicolors = true,
}
```

### Plugins

To add custom plugins, simply add plugin specs under `lua/custom/plugins` as you 
would do in Lazy (they will automatically be loaded). See [here](https://www.lazyvim.org/configuration) for more 
information on how to add and configure plugins via lazy.nvim.

Example:

```lua
-- In `lua/custom/plugins/telescope.lua`
--
-- This adds and configures the `nvim-telescope/telescope.nvim` plugin.

local M = {
    "nvim-telescope/nvim-telescope",
    dependencies = {
        "nvim-lua/plenary.nvim"
    },
}

M.opts = {
    pickers = {
        find_files = {
            hidden = true,
            no_ignore = false,
        },
    },
}

M.keys = {
    {
        "<leader>ff",
        "<cmd>Telescope find_files<cr>",
        mode = "n",
        desc = "(Telescope) Find files in project",
    },
}

return M
```
