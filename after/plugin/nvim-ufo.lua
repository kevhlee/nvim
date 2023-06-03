if not pcall(require, 'ufo') then
    return
end

require('ufo').setup {
    provider_selector = function(_, _, _)
        return { 'treesitter', 'indent' }
    end,
}

-- See https://neovim.io/doc/user/vimindex.html#z for commands

vim.keymap.set('n', 'zR', require('ufo').openAllFolds)
vim.keymap.set('n', 'zM', require('ufo').closeAllFolds)
