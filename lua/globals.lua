vim.g.mapleader = " "
vim.g.maplocalleader = " "

local ok, override = pcall(require, "custom.globals")
if ok and type(override) == "table" then
    for key, value in pairs(override) do
        vim.g[key] = value
    end
end
