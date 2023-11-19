return {
    "nvim-lualine/lualine.nvim",
    pin = true,
    dependencies = {
        { "nvim-tree/nvim-web-devicons", pin = true },
    },
    opts = {
        options = {
            theme = "auto",
            globalstatus = true,
            component_separators = "",
            section_separators = "",
            ignore_focus = { "TelescopePrompt" },
            refresh = {
                statusline = 1000,
                tabline = 1000,
                winbar = 1000,
            },
        },
        sections = {
            lualine_a = { "mode" },
            lualine_b = { "branch", "diff", "diagnostics" },
            lualine_c = {
                { "filename", path = 1 },
            },
            lualine_x = { "encoding", "fileformat", "filetype" },
            lualine_y = { "progress" },
            lualine_z = { "location" },
        },
    },
}
