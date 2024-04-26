return {
    "numToStr/Comment.nvim",
    config = function()
        require("Comment").setup({
            padding = true,
            mappings = {
                basic = true,
            },
        })

        require("Comment.ft").set("json", { "//%s", "/*%s*/" })
    end,
}
