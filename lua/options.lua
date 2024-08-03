vim.opt.expandtab = true
vim.opt.fixeol = false
vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.swapfile = false
vim.opt.termguicolors = true
vim.opt.undofile = true
vim.opt.wrap = false

local ok, options = pcall(require, "custom.options")
if ok and type(options) == "table" then
    for key, value in pairs(options) do
        vim.opt[key] = value
    end
end
