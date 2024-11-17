return {
    "NMAC427/guess-indent.nvim",
    event = { "BufFilePost", "BufNewFile", "BufReadPost" },
    opts = {
        buftype_exclude = {
            "harpoon",
            "help",
            "lazy",
            "netrw",
            "nofile",
            "oil",
            "terminal",
            "TelescopePrompt",
        },
    },
}
