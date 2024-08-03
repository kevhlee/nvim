return {
    "j-hui/fidget.nvim",
    lazy = true,
    event = "VeryLazy",
    opts = {
        progress = {
            ignore = {}, -- List of LSP servers to ignore
            display = {
                render_limit = 12, -- How many LSP messages to show at once
                done_ttl = 3, -- How long a message should persist after completion
            },
        },
        notification = {
            override_vim_notify = false,
            window = {
                winblend = 100,
                border = "rounded",
                align = "top",
                relative = "editor",
            },
        },
    },
}
