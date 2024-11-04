local options = {
    fixeol = false,
    hlsearch = false,
    incsearch = true,
    laststatus = 3,
    list = true,
    listchars = { tab = "» ", trail = "·", nbsp = "␣" },
    number = true,
    relativenumber = true,
    scrolloff = 12,
    showmode = false,
    signcolumn = "yes",
    splitbelow = true,
    splitright = true,
    swapfile = false,
    timeoutlen = 500,
    updatetime = 250,
    wrap = false,
}

local ok, override = pcall(require, "override.options")
if ok and type(override) == "table" then
    options = vim.tbl_extend("force", options, override)
end

for key, value in pairs(options) do
    vim.opt[key] = value
end
