local M = {
    "j-hui/fidget.nvim",
    event = "UIEnter",
}

M.opts = {
    notification = {
        override_vim_notify = true,
        window = {
            align = "top",
            winblend = 0,
        },
    },
}

return M
