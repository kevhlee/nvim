# nvim-config

My configuration for [Neovim](https://neovim.io/).

## Setup

Clone this repository into `$HOME/.config/nvim`:

```bash
$ mkdir -p $HOME/.config/nvim
$ git clone --depth 1 https://github.com/kevhlee/nvim-config.git $HOME/.config/nvim
```

## Customization

To customize and configure Neovim, create a `lua/custom` directory containing the following files:

```log
./lua
└── custom
    ├── globals.lua     // Set up globals
    ├── lsp.lua         // Set up configurations for LSP servers
    ├── options.lua     // Set up options
    └── plugins.lua     // Set up and configure plugins
```

Each custom file should return a table.

For plugins, [lazy.nvim](https://github.com/folke/lazy.nvim) is used.

For LSP, [lsp-zero](https://github.com/VonHeikemen/lsp-zero.nvim) is used.

Here are some examples for how to create custom configurations:

__For `globals.lua`:__

```lua
local M = {
    mapleader = ' ',
    maplocalleader = ' ',
}

return M
```

__For `options.lua`:__

```lua
local M = {
    background = 'dark',
    fixeol = false,
}

return M
```

__For `plugins.lua`:__

```lua
local M = {}

table.insert(M, {
    'nvim-treesitter/nvim-treesitter',
    config = function()
        require('nvim-treesitter.configs').setup {
            auto_install = true,
            ensure_installed = {
                'lua',
                'markdown',
                'vim',
            },
            highlight = {
                enable = true,
            },
        }
    end,
})

table.insert(M, {
    'rose-pine/neovim',
    name = 'rose-pine',
    lazy = false,
    priority = 1000,
    config = function()
        require('rose-pine').setup {
            dark_variant = 'moon', -- main, moon
            dim_nc_background = false,
            disable_background = false,
            disable_float_background = false,
            disable_italics = true,
        }

        vim.cmd [[colorscheme rose-pine]]
    end,
})

return M
```

__For `lsp.lua`:__

```lua
local M = {}

M.lua_ls = {
    settings = {
        Lua = {
            diagnostics = {
                globals = { 'use', 'vim' },
            },
            workspace = {
                library = {
                    [vim.fn.expand '$VIMRUNTIME/lua'] = true,
                    [vim.fn.expand '$VIMRUNTIME/lua/vim/lsp'] = true,
                },
            },
        },
    },
}

return M
```
