return {
    "stevearc/quicker.nvim",
    event = "FileType qf",
    keys = {
        {
            "<leader>q",
            function()
                require("quicker").toggle({
                    focus = true,
                    min_height = 10,
                    max_height = 10,
                    -- See `:h nvim_parse_cmd()` for more information on
                    -- `open_cmd_mods`.
                    open_cmd_mods = {
                        split = "botright",
                    },
                })
            end,
            desc = "(Quicker) Toggle quickfix list",
        },
        {
            "<leader>l",
            function()
                require("quicker").toggle({
                    focus = true,
                    loclist = true,
                    min_height = 10,
                    max_height = 10,
                    -- See `:h nvim_parse_cmd()` for more information on
                    -- `open_cmd_mods`.
                    open_cmd_mods = {
                        split = "botright",
                    },
                })
            end,
            desc = "(Quicker) Toggle location list",
        },
    },
    opts = {
        highlight = {
            lsp = false,
            load_buffers = false,
        },
        keys = {
            {
                "<",
                function()
                    require("quicker").collapse()
                end,
                desc = "(Quicker) Collapse quickfix context",
            },
            {
                ">",
                function()
                    require("quicker").expand()
                end,
                desc = "(Quicker) Expand quickfix context",
            },
            {
                "<C-l>",
                function()
                    require("quicker").refresh()
                end,
                desc = "(Quicker) Refresh quickfix/location list",
            },
        },
    },
}
