vim.o.fixeol = false
vim.o.hlsearch = false
vim.o.incsearch = true
vim.o.number = true
vim.o.relativenumber = true
vim.o.splitbelow = true
vim.o.splitright = true
vim.o.swapfile = false
vim.o.undofile = true
vim.o.wrap = false

local ok, override = pcall(require, "custom.options")
if ok and type(override) == "table" then
    for key, value in pairs(override) do
        vim.o[key] = value
    end
end
