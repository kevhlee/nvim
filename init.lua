require("globals")
require("options")
require("keymaps")
require("autocmds")
require("lsp")

local lazy_repo = "https://github.com/folke/lazy.nvim.git"
local lazy_path = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.uv.fs_stat(lazy_path) then
    local out = vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "--branch=stable",
        lazy_repo,
        lazy_path,
    })

    if vim.v.shell_error > 0 then
        vim.api.nvim_echo({
            { "Could not clone lazy.nvim:\n" .. out .. "\n", "ErrorMsg" },
        }, true, {})
        return
    else
    end
end

vim.opt.rtp:prepend(lazy_path)

local lazy_spec = {
    { import = "plugins" },
}

local stat = vim.uv.fs_stat(vim.fn.stdpath("config") .. "/lua/plugins/override")
if stat and stat.type == "directory" then
    table.insert(lazy_spec, { import = "plugins.override" })
end

require("lazy").setup({
    spec = lazy_spec,
    change_detection = {
        notify = false,
    },
    install = {
        colorscheme = { "default" },
    },
    performance = {
        rtp = {
            disabled_plugins = {
                "gzip",
                "matchit",
                "matchparen",
                "netrwPlugin",
                "spellfile",
                "tarPlugin",
                "tohtml",
                "tutor",
            },
        },
    },
})
