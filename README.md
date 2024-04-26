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
