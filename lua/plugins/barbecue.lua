return {
    'utilyre/barbecue.nvim',
    tag = 'v1.2.0',
    dependencies = {
        'SmiteshP/nvim-navic',
        'nvim-tree/nvim-web-devicons',
    },
    config = function()
        require('barbecue').setup()

        vim.keymap.set('n', '<leader>tw', require('barbecue.ui').toggle)
    end,
}
