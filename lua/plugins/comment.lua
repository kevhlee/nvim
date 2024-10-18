local M = {
    "numToStr/Comment.nvim",
    event = { "BufReadPre", "BufNewFile" },
}

M.config = function()
    require("Comment").setup({
        padding = true,
        mappings = {
            basic = true,
        },
    })

    require("Comment.ft").set("json", { "//%s", "/*%s*/" })
end

return M
