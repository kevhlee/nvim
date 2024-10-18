local M = {}

table.insert(M, {
    "tpope/vim-sleuth",
    event = { "BufReadPre", "BufNewFile" },
})

return M
