return {
    "nvim-tree/nvim-tree.lua",
    config = function()
        require("nvim-tree").setup({})
    end,
    priority = 1000,
    lazy = false,
}
