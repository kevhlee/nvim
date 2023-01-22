local ok, plugin = pcall(require, 'indent_blankline')
if not ok then
    return
end

plugin.setup {
    show_current_context = true,
    show_current_context_start = true,
    char = '▏',
    context_char = '▏',
}
