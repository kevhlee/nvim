local M = {
    "stevearc/dressing.nvim",
    event = "UIEnter",
}

M.opts = {
    select = {
        backend = { "telescope", "builtin" },
    },
}

return M
