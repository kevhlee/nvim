return {
    "utilyre/barbecue.nvim",
    name = "barbecue",
    tag = "v1.2.0",
    pin = true,
    dependencies = {
        { "SmiteshP/nvim-navic", pin = true },
        { "nvim-tree/nvim-web-devicons", pin = true },
    },
    config = function()
        require("barbecue").setup()
    end,
}
