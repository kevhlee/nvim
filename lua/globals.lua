vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

local ok, custom = pcall(require, 'custom.globals')
if ok then
    for key, value in pairs(custom) do
        vim.g[key] = value
    end
end
