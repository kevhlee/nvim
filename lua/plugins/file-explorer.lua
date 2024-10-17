local M = {
    "stevearc/oil.nvim",
    lazy = true,
    event = "VeryLazy",
    dependencies = {
        { "nvim-tree/nvim-web-devicons" },
    },
}

M.opts = {
    columns = {
        "icon",
        "permissions",
    },
    keymaps = {
        ["<Esc>"] = "actions.close",
        ["<C-h>"] = "actions.show_help",
        ["<C-r>"] = "actions.refresh",
        ["<C-o>"] = "actions.open_external",
        ["<C-v>"] = {
            "actions.select",
            opts = { vertical = true },
            desc = "Open the entry in a vertical split",
        },
        ["<C-x>"] = {
            "actions.select",
            opts = { horizontal = true },
            desc = "Open the entry in a horizontal split",
        },

        -- Remove these mappings
        ["g?"] = false,
        ["<C-s>"] = false,
        ["<C-l>"] = false,
        ["`"] = false,
        ["~"] = false,
        ["gs"] = false,
        ["gx"] = false,
        ["g."] = false,
        ["g\\"] = false,
    },
    view_options = {
        show_hidden = true,
        sort = {
            { "type", "asc" },
            { "name", "asc" },
        },
    },
}

M.keys = {
    {
        "<C-n>",
        function()
            require("oil").toggle_float()
        end,
        desc = "(Oil) Toggle file explorer from current file",
    },
}

return M
