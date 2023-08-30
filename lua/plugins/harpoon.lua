return {
    'ThePrimeagen/harpoon',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
        require('harpoon').setup()

        vim.keymap.set('n', '<leader>mm', require('harpoon.mark').add_file)
        vim.keymap.set(
            'n',
            '<leader>fm',
            require('harpoon.ui').toggle_quick_menu
        )
    end,
}
