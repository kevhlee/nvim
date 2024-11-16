local M = {
    "lewis6991/gitsigns.nvim",
    cmd = "Gitsigns",
    event = "BufReadPost",
    opts = {
        attach_to_untracked = true,
        current_line_blame_formatter = "<author>, <author_time:%Y-%m-%d> <abbrev_sha> - <summary>",
        -- stylua: ignore
        signs = {
            add          = { text = "┆" },
            change       = { text = "┆" },
            delete       = { text = "_" },
            topdelete    = { text = "‾" },
            changedelete = { text = "~" },
            untracked    = { text = "┆" },
        },
        -- stylua: ignore
        signs_staged = {
            add          = { text = "┆" },
            change       = { text = "┆" },
            delete       = { text = "_" },
            topdelete    = { text = "‾" },
            changedelete = { text = "~" },
            untracked    = { text = "┆" },
        },
    },
}

M.keys = {
    {
        "<leader>hp",
        "<Cmd>Gitsigns preview_hunk<CR>",
        desc = "(Gitsigns) Preview diff of current hunk",
    },
    {
        "<leader>hj",
        "<Cmd>Gitsigns next_hunk<CR>",
        desc = "(Gitsigns) Jump to next hunk",
    },
    {
        "<leader>hk",
        "<Cmd>Gitsigns prev_hunk<CR>",
        desc = "(Gitsigns) Jump to previous hunk",
    },
    {
        "<leader>hs",
        "<Cmd>Gitsigns stage_hunk<CR>",
        desc = "(Gitsigns) Stage current hunk",
    },
    {
        "<leader>hS",
        "<Cmd>Gitsigns stage_buffer<CR>",
        desc = "(Gitsigns) Stage current buffer",
    },
    {
        "<leader>hr",
        "<Cmd>Gitsigns reset_hunk<CR>",
        desc = "(Gitsigns) Reset current hunk",
    },
    {
        "<leader>hR",
        "<Cmd>Gitsigns reset_buffer<CR>",
        desc = "(Gitsigns) Reset current buffer",
    },
    {
        "<leader>hb",
        "<Cmd>Gitsigns blame_line<CR>",
        desc = "(Gitsigns) Run Git blame on current line",
    },
    {
        "<leader>hB",
        function()
            require("gitsigns").blame_line({ full = true })
        end,
        desc = "(Gitsigns) Run Git blame on current line",
    },
    {
        "<leader>hd",
        "<Cmd>Gitsigns diffthis<CR>",
        desc = "(Gitsigns) Run vimdiff on current buffer",
    },
}

return M
