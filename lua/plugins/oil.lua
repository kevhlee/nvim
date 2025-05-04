return {
    "stevearc/oil.nvim",
    keys = {
        { "-", "<Cmd>Oil<CR>", desc = "(Oil) Open file browser" },
    },
    opts = {
        columns = {
            "icon",
            "permissions",
        },
        keymaps = {
            ["q"] = "actions.close",
            ["<C-v>"] = {
                "actions.select",
                opts = { close = true, vertical = true },
                desc = "Open the entry in a vertical split",
            },
            ["<C-s>"] = {
                "actions.select",
                opts = { close = true, horizontal = true },
                desc = "Open the entry in a horizontal split",
            },
            ["<C-r>"] = "actions.refresh",
            ["<C-h>"] = false,
            ["<C-l>"] = false,
        },
        view_options = {
            show_hidden = true,
        },
    },
}
