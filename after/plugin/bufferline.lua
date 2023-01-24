local ok_scope, plugin_scope = pcall(require, 'scope')
if ok_scope then
    plugin_scope.setup()
end

local ok_bufferline, plugin_bufferline = pcall(require, 'bufferline')
if not ok_bufferline then
    return
end

plugin_bufferline.setup {
    options = {
        mode = 'buffers', -- 'tabs', 'buffers'
        diagnostics = 'nvim_lsp', -- 'nvim_lsp', false
        numbers = 'ordinal',
        tab_size = 9,
        offsets = {
            {
                filetype = 'NvimTree',
                text = 'File Explorer',
                text_align = 'center',
                separator = true,
            },
        },
        show_tab_indicators = true,
    },
}

local keymap = vim.keymap

keymap.set('n', '<leader>bx,', '<cmd>BufferLineCloseLeft<cr>')
keymap.set('n', '<leader>bx.', '<cmd>BufferLineCloseRight<cr>')

keymap.set('n', '<leader>1', '<cmd>BufferLineGoToBuffer 1<cr>')
keymap.set('n', '<leader>2', '<cmd>BufferLineGoToBuffer 2<cr>')
keymap.set('n', '<leader>3', '<cmd>BufferLineGoToBuffer 3<cr>')
keymap.set('n', '<leader>4', '<cmd>BufferLineGoToBuffer 4<cr>')
keymap.set('n', '<leader>5', '<cmd>BufferLineGoToBuffer 5<cr>')
keymap.set('n', '<leader>6', '<cmd>BufferLineGoToBuffer 6<cr>')
keymap.set('n', '<leader>7', '<cmd>BufferLineGoToBuffer 7<cr>')
keymap.set('n', '<leader>8', '<cmd>BufferLineGoToBuffer 8<cr>')
keymap.set('n', '<leader>9', '<cmd>BufferLineGoToBuffer 9<cr>')
