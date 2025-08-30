vim.api.nvim_create_autocmd("FileType", {
    callback = function(args)
        vim.keymap.set("n", "q", "<Cmd>quit<CR>", { buffer = args.buf })
    end,
    desc = "Close buffer with 'q'",
    pattern = {
        "fugitive",
        "git",
        "help",
        "man",
        "qf",
        "scratch",
    },
})
