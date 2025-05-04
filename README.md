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
$ git clone --depth 1 https://github.com/kevhlee/nvim.git $HOME/.config/nvim
```

## Customization

This configuration is designed to allow additional customizations and
overrides. This is primarily done via the `/lua/override` directory:

```log
./lua/override
├── autocmd.lua      # Add additional autocommands
├── globals.lua      # Add/override global values (i.e. `vim.g`)
├── keymaps.lua      # Add/override key mappings
├── options.lua      # Add/override option values (i.e. `vim.o`)
└── plugins          # Add/override plugin specs (via lazy.nvim)
    ├── spec-A.lua
    ├── spec-B.lua
    ├── ...
    └── spec-Z.lua
```

### Globals

The `lua/override/globals.lua` file allows adding/overriding global values
(`vim.g`) and should return a key-value table.

Example:

```lua
-- In 'lua/override/globals.lua'
return {
    mapleader = " ",
    netrw_banner = 0,
}
```

### Options

The `lua/override/options.lua` file allows adding/overriding option values
(`vim.o`) and should return a key-value table.

Example:

```lua
-- In 'lua/override/options.lua'
return {
    expandtab = true,
    list = true,
    listchars = { tab = "» ", trail = "·", nbsp = "␣" },
    swapfile = false,
}
```

### Key mappings

The `lua/override/keymaps.lua` file allow adding/overriding key mappings and
should return an array table with each element representing the arguments passed
to `vim.keymap.set()`.

Example:

```lua
-- In 'lua/override/keymaps.lua'
return {
    {
        mode = "n",
        lhs = "-",
        rhs = "<Cmd>Explore<CR>",
        opts = {
            desc = "Open file browser",
        },
    },
    {
        mode = { "n", "i" },
        lhs = "<C-;>",
        rhs = function()
            print("Hello, world")
        end,
    },
}
```

See the following documentation for more information:
<https://neovim.io/doc/user/lua-guide.html#lua-guide-mappings-set>

### Autocommands

The `lua/override/autocmd.lua` allows adding new autocommands. The file should
return an array table where each element represents the arguments passed to
`nvim_create_autocmd()`.

Example:

```lua
-- In 'lua/override/autocmd.lua'
return {
    {
        event = { "BufEnter", "WinEnter" },
        opts = {
            pattern = "*",
            callback = function()
                vim.notify("This is a warning.", vim.log.levels.WARN)
            end,
        },
    },
}
```

See documentation on autocommands for more information:

- <https://neovim.io/doc/user/autocmd.html>
- <https://neovim.io/doc/user/api.html#nvim_create_autocmd()>

### Plugins

Plugin configurations can be added/overridden using the `lua/override/plugins`
directory. Simply add a file returning a Lazy plugin spec to the directory. See
<https://lazy.folke.io/spec> for more information.

```lua
-- In 'lua/override/plugins/vim-fugitive.lua'
return {
    "tpope/vim-fugitive",
    cmd = "Git",
}

-- In 'lua/override/plugins/oil.lua'
local M = {
    "stevearc/oil.nvim",
    dependencies = {
        "nvim-tree/nvim-web-devicons",
    },
}

M.opts = {
    columns = {
        "icon",
        "permissions",
    },
}

M.keys = {
    { "-", "<Cmd>Oil<CR>", desc = "(Oil) Open file browser" },
}

return M
```
