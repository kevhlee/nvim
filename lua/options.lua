vim.o.expandtab = true
vim.o.fixeol = false
vim.o.hlsearch = false
vim.o.incsearch = true
vim.o.number = true
vim.o.relativenumber = true
vim.o.smartindent = true
vim.o.splitbelow = true
vim.o.splitright = true
vim.o.swapfile = false
vim.o.termguicolors = true
vim.o.undofile = true
vim.o.wrap = false

local ok, options = pcall(require, "custom.options")
if ok and type(options) == "table" then
    for key, value in pairs(options) do
        vim.o[key] = value
    end
end
