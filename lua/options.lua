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

local ok, custom = pcall(require, 'custom.options')
if ok then
    for key, value in pairs(custom) do
        vim.opt[key] = value
    end
end
