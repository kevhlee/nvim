local M = {
    "stevearc/resession.nvim",
    opts = {},
}

M.keys = {
    {
        "<leader>ss",
        function()
            require("resession").save(vim.fn.getcwd(), {
                attach = false,
                notify = true,
            })
        end,
        desc = "(Resession) Save/overwrite a session for current working directory",
    },
    {
        "<leader>sl",
        function()
            require("resession").load(vim.fn.getcwd(), {
                attach = false,
                reset = true,
            })

            vim.notify("Loaded session for current working directory")
        end,
        desc = "(Resession) Load saved session for current working directory",
    },
    {
        "<leader>sd",
        function()
            require("resession").delete(vim.fn.getcwd())

            vim.notify("Deleted session for current working directory")
        end,
        desc = "(Resession) Delete saved session for current working directory",
    },
}

return M
