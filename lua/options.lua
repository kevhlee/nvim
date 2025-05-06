local options = {
    -- General
    backup = false,
    swapfile = false,
    undofile = true,
    writebackup = false,

    -- Appearance
    breakindent = true,
    hlsearch = false,
    incsearch = true,
    laststatus = 3,
    number = true,
    relativenumber = true,
    scrolloff = 12,
    showmode = false,
    signcolumn = "yes",
    splitbelow = true,
    splitright = true,
    termguicolors = true,
    wrap = false,

    -- Editing
    completeopt = "menu,menuone,noinsert,noselect",
    fixeol = false,
    foldexpr = "v:lua.vim.treesitter.foldexpr()",
    foldlevel = 99,
    foldmethod = "expr",
    ignorecase = true,
    smartcase = true,
    smartindent = true,
    timeoutlen = 500,
    virtualedit = "block",
}

local ok, override = pcall(require, "override.options")
if ok and type(override) == "table" then
    options = vim.tbl_extend("force", options, override)
end

for key, value in pairs(options) do
    vim.opt[key] = value
end
