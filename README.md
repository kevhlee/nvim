# My Neovim Configuration

My configuration for [Neovim](https://neovim.io/).

Uses [lazy.nvim](https://github.com/folke/lazy.nvim) as the package manager.

## Setup

**Dependencies:**

- gcc
- make
- [Go](https://golang.google.cn/) (1.21+)
- [ripgrep](https://github.com/BurntSushi/ripgrep/)
- [StyLua](https://github.com/JohnnyMorganz/StyLua/) (optional)

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

This Neovim configuration was designed to allow additional customizations so
that it can be used any context. Customization is primarily done via the
`/lua/override` directory:

```log
./lua/override
├── autocmd.lua      # Add additional autocommands
├── formatter.lua    # Add/override formatters (via conform.nvim)
├── globals.lua      # Add/override global values (i.e. `vim.g`)
├── keymaps.lua      # Add/override key mappings
├── lsp.lua          # Add/override LSP configurations (via nvim-lspconfig)
├── options.lua      # Add/override option values (i.e. `vim.o`)
└── plugins          # Add/override plugin specs (via lazy.nvim)
    ├── spec-A.lua
    ├── spec-B.lua
    ├── ...
    └── spec-Z.lua
```

### Globals

The `lua/override/globals.lua` file should return a key-value table containing
the global values (i.e. `vim.g`) to add/override.

Example:

```lua
-- In 'lua/override/globals.lua'
return {
    mapleader = " ",
    netrw_banner = 0,
}
```

### Options

The `lua/override/options.lua` file should return a key-value table containing
the option values (`vim.o`) to add/override.

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

The `lua/override/keymaps.lua` file should return an array table where each
element is the arguments passed to `vim.keymap.set()`.

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
            print("This is a dumb key mapping")
        end,
    },
}
```

See the following documentation for more information: <https://neovim.io/doc/user/lua-guide.html#lua-guide-mappings-set>.

### Autocommands

The `lua/override/autocmd.lua` allows adding new autocommands. The file should
return an array table where each element is the arguments passed to
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
    {
        event = "BufReadPost",
        opts = {
            pattern = "*",
            callback = function()
                for _, buf in ipairs(vim.api.nvim_list_bufs()) do
                    if vim.api.nvim_buf_is_loaded(buf)
                        and vim.api.nvim_buf_get_name(buf) == ""
                        and vim.api.nvim_get_option_value("buftype", { buf = buf }) == ""
                    then
                        vim.api.nvim_buf_delete(buf, { force = true })
                    end
                end
            end,
        },
    },
}
```

See documentation on autocommands for more information:

- <https://neovim.io/doc/user/autocmd.html>
- <https://neovim.io/doc/user/api.html#nvim_create_autocmd()>

### Formatter

The `lua/override/formatter.lua` file allows adding and configuring code
formatters. The plugin [stevearc/conform.nvim](https://github.com/stevearc/conform.nvim) is used to configure the
formatters. See <https://github.com/stevearc/conform.nvim> to learn how to
configure the formatters. For now, this Neovim configuration allows configuring
the `formatters` and the `formatters_by_ft` properties.

Example:

```lua
-- In 'lua/override/formatter.lua'
return {
    formatters = {
        ["stylua"] = {
            prepend_args = { "--indent-type", "Tabs" },
        },
    },
    formatters_by_ft = {
        ["go"] = { "gofmt", lsp_format = "never" },
        ["lua"] = { "stylua", lsp_format = "fallback" },
    },
}
```

### LSP

The `lua/override/lsp.lua` file is for custom LSP configurations. It return a
key-value table, where the key is the LSP server name and the value is a
callback returning a configuration for the LSP client. The callback receives a
parameter `default_config` containing defaults for a LSP client configuration
(i.e. `vim.lsp.ClientConfig`).

Example:

```lua
-- In 'lua/override/lsp.lua'
local configs = {}

configs["pyright"] = function(default_config)
    return default_config
end

configs["lua_ls"] = function(default_config)
    local default_on_attach = default_config.on_attach

    return vim.tbl_extend(
        "force",
        default_config,
        {
            on_attach = function(client, bufnr)
                default_on_attach(client, bufnr)

                -- Disable semantic highlighting
                client.server_capabilities.semanticTokensProvider = nil
            end,
        }
    )
end

return configs
```

### Plugins

New plugins can be added while current plugin configurations can be overridden
using the `lua/override/plugins` directory. The [lazy.nvim](https://github.com/folke/lazy.nvim) plugin manager to
load, configure, and add Neovim plugins. Simply add a file returning a Lazy
plugin spec to the directory. See <https://lazy.folke.io/spec> for more
information.

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
