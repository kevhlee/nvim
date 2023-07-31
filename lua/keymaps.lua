local ok, custom = pcall(require, 'custom.keymaps')
if ok then
    for _, keymap in ipairs(custom) do
        vim.keymap.set(unpack(keymap))
    end
end
