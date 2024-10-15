# My Neovim Configuration

My configuration for [Neovim](https://neovim.io/).

Uses [lazy.nvim](https://github.com/folke/lazy.nvim) as the package manager.

## Setup

Before proceeding, if you already have a Neovim configuration, create a backup 
so you can restore your current Neovim setup:

```sh
mv ~/.config/nvim{,.bak}

# optional
mv ~/.local/share/nvim{,.bak}
mv ~/.local/state/nvim{,.bak}
mv ~/.cache/nvim{,.bak}
```

Clone this repository into `$HOME/.config/nvim`:

```sh
$ git clone --depth 1 https://github.com/kevhlee/nvim-config.git $HOME/.config/nvim
```

## Configuration

This Neovim configuration has the following structure:

```bash
.
├── init.lua
└── lua
    ├── globals.lua  # Sets global variables (i.e. `vim.g`)
    ├── keymaps.lua  # Sets general key mappings
    ├── options.lua  # Sets option variables (i.e. `vim.o`)
    └── plugins/     # Contains plugin configurations
```

To add/override configurations in `lua/globals.lua` or `lua/options.lua`, simply create a file with the same name in 
the `lua/custom` directory that returns a table containing the overrides:

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

