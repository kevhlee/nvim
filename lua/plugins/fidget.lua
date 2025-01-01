return {
    "j-hui/fidget.nvim",
    event = "UIEnter",
    opts = {
        notification = {
            override_vim_notify = true,
            window = {
                align = "top",
                winblend = 0,
            },
        },
    },
}
