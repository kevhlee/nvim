-- Allow Alt-Backspace during editing
vim.keymap.set("i", "<M-BS>", "<C-w>")

local ok, override = pcall(require, "custom.keymaps")
if ok and type(override) == "table" then
    for _, keymap in ipairs(override) do
        vim.keymap.set(keymap.mode, keymap.lhs, keymap.rhs, keymap.opts)
    end
end
