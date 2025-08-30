-- Clipboard
vim.keymap.set("v", "<M-c>", '"+y')

-- Diagnostics
vim.keymap.set("n", "gl", vim.diagnostic.open_float)
vim.keymap.set("n", "[e", function()
    vim.diagnostic.jump({
        count = -1,
        severity = vim.diagnostic.severity.ERROR,
    })
end)
vim.keymap.set("n", "]e", function()
    vim.diagnostic.jump({
        count = 1,
        severity = vim.diagnostic.severity.ERROR,
    })
end)

-- Windows
vim.keymap.set("n", "<C-h>", "<C-w><C-h>")
vim.keymap.set("n", "<C-l>", "<C-w><C-l>")
vim.keymap.set("n", "<C-j>", "<C-w><C-j>")
vim.keymap.set("n", "<C-k>", "<C-w><C-k>")

-- Quickfix
vim.keymap.set("n", "<q", "<Cmd>colder<CR>")
vim.keymap.set("n", ">q", "<Cmd>cnewer<CR>")
vim.keymap.set("n", "<Leader>q", function()
    local qflist = vim.fn.getqflist({ winid = 0, size = 0 })
    if qflist.winid == 0 then
        if qflist.size > 0 then
            vim.cmd("botright copen")
        else
            vim.notify("Quickfix list is empty", vim.log.levels.INFO)
        end
    else
        vim.cmd("cclose")
    end
end, { desc = "Toggle quickfix list" })

-- Location list
vim.keymap.set("n", "<l", "<Cmd>lolder<CR>")
vim.keymap.set("n", ">l", "<Cmd>lnewer<CR>")
vim.keymap.set("n", "<Leader>l", function()
    local loclist = vim.fn.getloclist(0, { winid = 0, size = 0 })
    if loclist.winid == 0 then
        if loclist.size > 0 then
            vim.cmd("lopen")
        else
            vim.notify("Location list is empty", vim.log.levels.INFO)
        end
    else
        vim.cmd("lclose")
    end
end, { desc = "Toggle location list" })
