local M = {}

table.insert(M, {
    "tpope/vim-fugitive",
    cmd = "Git",
})

table.insert(M, {
    "lewis6991/gitsigns.nvim",
    opts = {
        attach_to_untracked = true,
        max_file_length = 9999,
        preview_config = {
            border = "rounded",
            relative = "cursor",
        },
        update_debounce = 500,
    },
    keys = {
        {
            "<leader>hb",
            function()
                require("gitsigns").blame_line({ full = true })
            end,
            desc = "(Gitsigns) Run 'git blame' on current line",
        },
        {
            "<leader>hp",
            "<cmd>Gitsigns preview_hunk<cr>",
            desc = "(Gitsigns) Preview current hunk",
        },
        {
            "<leader>hs",
            "<cmd>Gitsigns stage_hunk<cr>",
            desc = "(Gitsigns) Stage current hunk",
        },
        {
            "<leader>hs",
            function()
                require("gitsigns").stage_hunk({
                    vim.fn.line("."),
                    vim.fn.line("v"),
                })
            end,
            mode = "v",
            desc = "(Gitsigns) Stage hunks in visual block",
        },
        {
            "<leader>hS",
            "<cmd>Gitsigns stage_buffer<cr>",
            desc = "(Gitsigns) Stage current buffer",
        },
        {
            "<leader>hr",
            "<cmd>Gitsigns reset_hunk<cr>",
            desc = "(Gitsigns) Reset current hunk",
        },
        {
            "<leader>hr",
            function()
                require("gitsigns").stage_hunk({
                    vim.fn.line("."),
                    vim.fn.line("v"),
                })
            end,
            mode = "v",
            desc = "(Gitsigns) Reset hunks in visual block",
        },
        {
            "<leader>hR",
            "<cmd>Gitsigns reset_buffer<cr>",
            desc = "(Gitsigns) Reset current buffer",
        },
        {
            "<leader>hd",
            function()
                require("gitsigns").diffthis(nil, { vertical = false })
            end,
            desc = "(Gitsigns) Run a 'vimdiff' on current file against index",
        },
        {
            "<leader>hD",
            function()
                require("gitsigns").diffthis("~", { vertical = false })
            end,
            desc = "(Gitsigns) Run a 'vimdiff' on current file against '~'",
        },
    },
})

return M
