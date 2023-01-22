local keymap = vim.keymap

-- ##
-- ## Buffers
-- ##

keymap.set('n', ',b', '<cmd>:bprev<cr>')
keymap.set('n', '.b', '<cmd>:bnext<cr>')

-- ##
-- ## Tabs
-- ##

keymap.set('n', ',t', '<cmd>:tabprev<cr>')
keymap.set('n', '.t', '<cmd>:tabnext<cr>')
