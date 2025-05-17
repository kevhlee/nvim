return {
    "lewis6991/gitsigns.nvim",
    event = { "BufNewFile", "BufReadPost" },
    opts = {
        attach_to_untracked = true,
        on_attach = function(bufnr)
            if vim.bo[bufnr].filetype == "bigfile" then
                return false
            end

            local opts = { buffer = bufnr }
            local gitsigns = require("gitsigns")

            vim.keymap.set("n", "<Leader>hs", gitsigns.stage_hunk, opts)
            vim.keymap.set("n", "<Leader>hS", gitsigns.stage_buffer, opts)
            vim.keymap.set("n", "<Leader>hr", gitsigns.reset_hunk, opts)
            vim.keymap.set("n", "<Leader>hR", gitsigns.reset_buffer, opts)
            vim.keymap.set("n", "<Leader>hb", gitsigns.blame_line, opts)
            vim.keymap.set("n", "<Leader>hp", gitsigns.preview_hunk, opts)
            vim.keymap.set("n", "<Leader>hq", gitsigns.setqflist, opts)
            vim.keymap.set("n", "<Leader>hl", gitsigns.setloclist, opts)
            vim.keymap.set("n", "<Leader>hd", gitsigns.diffthis, opts)
            vim.keymap.set({ "o", "x" }, "gh", gitsigns.select_hunk, opts)

            vim.keymap.set("n", "[h", function()
                gitsigns.nav_hunk("prev")
            end, opts)
            vim.keymap.set("n", "]h", function()
                gitsigns.nav_hunk("next")
            end, opts)
            vim.keymap.set("n", "[H", function()
                gitsigns.nav_hunk("first")
            end, opts)
            vim.keymap.set("n", "]H", function()
                gitsigns.nav_hunk("last")
            end, opts)

            vim.keymap.set("n", "<Leader>hB", function()
                gitsigns.blame(function(blame_bufnr)
                    vim.keymap.set("n", "q", "<Cmd>quit<CR>", { buffer = blame_bufnr })
                end)
            end, opts)
        end,
    },
}
