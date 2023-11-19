vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.g.netrw_banner = 0
vim.g.netrw_fastbrowse = 0

local ok, globals = pcall(require, "custom.globals")
if ok and type(globals) == "table" then
    for key, value in pairs(globals) do
        vim.g[key] = value
    end
end
