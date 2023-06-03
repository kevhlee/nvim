-- Tabs
vim.keymap.set('n', '<C-h>', '<cmd>tabprevious<cr>')
vim.keymap.set('n', '<C-l>', '<cmd>tabnext<cr>')
vim.keymap.set('n', '<C-x>', '<cmd>tabclose<cr>')

-- Folds

-- zA  open a closed fold or close an open fold recursively
-- zC  close folds recursively
-- zD  delete folds recursively
-- zE  eliminate all folds
-- zF  create a fold for N lines
-- zM  set 'foldlevel' to zero
-- zN  set 'foldenable'
-- zO  open folds recursively
-- zR  set 'foldlevel' to the deepest fold
-- zX  re-apply 'foldlevel'
-- za  open a closed fold, close an open fold
-- zc  close a fold
-- zd  delete a fold
-- zf  zf{motion}	   create a fold for Nmove text
-- zi  toggle 'foldenable'
-- zj  1  move to the start of the next fold
-- zk  1  move to the end of the previous fold
-- zm  subtract one from 'foldlevel'
-- zn  reset 'foldenable'
-- zo  open fold
-- zr  add one to 'foldlevel'
-- zv  open enough folds to view the cursor line
-- zx  re-apply 'foldlevel' and do "zv"
