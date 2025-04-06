require("globals")
require("options")
require("autocmd")
require("terminal")
require("keymaps")

local lazy_path = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
local lazy_repo = "https://github.com/folke/lazy.nvim.git"

if not (vim.uv or vim.loop).fs_stat(lazy_path) then
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

local spec = {
    { import = "plugins" },
}

if
    vim.fn.glob(vim.fn.stdpath("config") .. "/lua/override/plugins/*.lua") ~= ""
then
    table.insert(spec, { import = "override.plugins" })
end

require("lazy").setup({
    spec = spec,
    change_detection = {
        notify = false,
    },
    install = {
        colorscheme = { "default" },
    },
    performance = {
        rtp = {
            disabled_plugins = {
                "editorconfig",
                "gzip",
                "matchit",
                "matchparen",
                "netrwPlugin",
                "spellfile",
                "tarPlugin",
                "tohtml",
                "tutor",
                "zipPlugin",
            },
        },
    },
})
