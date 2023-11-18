local keymaps = {
    {
        mode = 'i',
        lhs = '<M-BS>',
        rhs = '<C-w>',
    },
}

local ok, custom = pcall(require, 'custom.keymaps')
if ok then
    vim.list_extend(keymaps, custom)
end

for _, keymap in ipairs(keymaps) do
    vim.keymap.set(keymap.mode, keymap.lhs, keymap.rhs, keymap.opts)
end
