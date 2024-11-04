local autocmds = {}

local ok, override = pcall(require, "override.autocmd")
if ok and type(override) == "table" then
    autocmds = vim.tbl_extend("force", autocmds, override)
end

for _, autocmd in pairs(autocmds) do
    vim.api.nvim_create_autocmd(autocmd.event, autocmd.opts)
end
