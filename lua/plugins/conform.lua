return {
    "stevearc/conform.nvim",
    cmd = "ConformInfo",
    keys = {
        {
            "<Leader>cf",
            function()
                require("conform").format({ async = true })
            end,
            mode = "",
            desc = "(Conform) Format buffer",
        },
    },
    opts = {
        formatters_by_ft = {
            ["lua"] = { "stylua" },
        },
    },
}
