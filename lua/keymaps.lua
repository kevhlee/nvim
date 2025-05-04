local keymaps = {
    -- Clipboard
    { mode = "v", lhs = "<M-c>", rhs = '"+y' },

    -- File
    { mode = "n", lhs = "-", rhs = "<Cmd>Explore<CR>" },

    -- Diagnostics
    { mode = "n", lhs = "gl", rhs = vim.diagnostic.open_float },

    -- Buffer
    { mode = "n", lhs = "<C-b>d", rhs = "<Cmd>bdelete<CR>" },

    -- Tab
    { mode = "n", lhs = "<M-h>", rhs = "<Cmd>tabprevious<CR>" },
    { mode = "n", lhs = "<M-l>", rhs = "<Cmd>tabnext<CR>" },
    { mode = "n", lhs = "<C-t>n", rhs = "<Cmd>tabnew<CR>" },
    { mode = "n", lhs = "<C-t>d", rhs = "<Cmd>tabclose<CR>" },

    -- Windows
    { mode = "n", lhs = "<C-h>", rhs = "<C-w><C-h>" },
    { mode = "n", lhs = "<C-l>", rhs = "<C-w><C-l>" },
    { mode = "n", lhs = "<C-j>", rhs = "<C-w><C-j>" },
    { mode = "n", lhs = "<C-k>", rhs = "<C-w><C-k>" },

    -- Quickfix
    { mode = "n", lhs = "<q", rhs = "<Cmd>colder<CR>" },
    { mode = "n", lhs = ">q", rhs = "<Cmd>cnewer<CR>" },
    {
        mode = "n",
        lhs = "<leader>q",
        rhs = function()
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
        end,
        opts = { desc = "Toggle quickfix list" },
    },

    -- Location list
    { mode = "n", lhs = "<l", rhs = "<Cmd>lolder<CR>" },
    { mode = "n", lhs = ">l", rhs = "<Cmd>lnewer<CR>" },
    {
        mode = "n",
        lhs = "<leader>l",
        rhs = function()
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
        end,
        opts = { desc = "Toggle location list" },
    },
}

local ok, override = pcall(require, "override.keymaps")
if ok and type(override) == "table" then
    keymaps = vim.tbl_extend("force", keymaps, override)
end

for _, keymap in pairs(keymaps) do
    vim.keymap.set(keymap.mode, keymap.lhs, keymap.rhs, keymap.opts or {})
end
