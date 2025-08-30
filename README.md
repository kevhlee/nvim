# My Neovim Configuration

My configuration for [Neovim](https://neovim.io/).

Uses [lazy.nvim](https://github.com/folke/lazy.nvim) as the package manager.

## Setup

Before proceeding, if you already have a Neovim configuration, create a backup so you can restore your current Neovim setup:

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

### Plugins

Plugin configurations can be added/overridden using the `lua/plugins/override` directory. Simply add a file returning a Lazy plugin spec to the directory. See <https://lazy.folke.io/spec> for more information.

```lua
-- In 'lua/plugins/override/vim-fugitive.lua'
return {
    "tpope/vim-fugitive",
    cmd = "Git",
}

-- In 'lua/plugins/override/oil.lua'
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

### LSP

LSP configurations can be defined by `lsp/<LSP server name>.lua` files in the `runtimepath`. See here for more information: <https://neovim.io/doc/user/lsp.html#lsp-config>.
