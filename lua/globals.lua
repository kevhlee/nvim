local globals = {
    mapleader = " ",
    maplocalleader = " ",
}

local ok, override = pcall(require, "override.globals")
if ok and type(override) == "table" then
    globals = vim.tbl_extend("force", globals, override)
end

for key, value in pairs(globals) do
    vim.g[key] = value
end
