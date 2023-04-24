# nvim-config

My configuration for [Neovim](https://neovim.io/).

## Setup

Clone this repository into `$HOME/.config/nvim`:

```bash
$ mkdir -p $HOME/.config/nvim
$ git clone --depth 1 https://github.com/kevhlee/nvim-config.git $HOME/.config/nvim
```

This configuration uses [lazy.nvim](https://github.com/folke/lazy.nvim) as its plugin manager. So, when
running Neovim for the first time, you must execute `:Lazy install` and restart.
