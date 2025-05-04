local autocmds = {
    {
        event = "FileType",
        opts = {
            callback = function(args)
                vim.keymap.set("n", "q", "<Cmd>quit<CR>", { buffer = args.buf })
            end,
            desc = "Close buffer with 'q'",
            pattern = {
                "git",
                "help",
                "man",
                "qf",
                "scratch",
            },
        },
    },
}

local ok, override = pcall(require, "override.autocmd")
if ok and type(override) == "table" then
    autocmds = vim.tbl_extend("force", autocmds, override)
end

for _, autocmd in pairs(autocmds) do
    vim.api.nvim_create_autocmd(autocmd.event, autocmd.opts)
end
