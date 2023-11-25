# My Neovim Configuration

My configuration for [Neovim](https://neovim.io/).

Uses [lazy.nvim](https://github.com/folke/lazy.nvim) as the package manager.

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
    ├── keymaps.lua     // Set up key mappings
    ├── lsp.lua         // Set up configurations for LSP servers
    ├── options.lua     // Set up options
    └── plugins         // Store plugin configurations
        ├── plugin_a.lua
        ├── plugin_b.lua
        └── ...
```
