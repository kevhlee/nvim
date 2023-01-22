local ok, plugin = pcall(require, 'scope')
if not ok then
    return
end

plugin.setup()
