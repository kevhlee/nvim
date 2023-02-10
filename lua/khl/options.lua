local opt = vim.opt

opt.background = 'dark'
opt.completeopt = 'menuone,noselect'
opt.expandtab = true
opt.fixeol = false
opt.hlsearch = false
opt.ignorecase = true
opt.incsearch = true
opt.number = true
opt.relativenumber = true
opt.scrolloff = 8
opt.shiftwidth = 4
opt.smartcase = true
opt.smartindent = true
opt.splitbelow = true
opt.splitright = true
opt.swapfile = false
opt.tabstop = 4
opt.termguicolors = true
opt.updatetime = 100
opt.undofile = true
opt.wrap = false

-- ##
-- ## Custom
-- ##

local M = {}

M.setup = function(config)
    if config.options == nil then
        return
    end

    for key, value in pairs(config.options) do
        opt[key] = value
    end
end

return M
