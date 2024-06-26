return {
    "nvimdev/dashboard-nvim",
    event = "VimEnter",
    config = function()
        require("dashboard").setup {
            theme = "hyper", --  theme is doom and hyper default is hyper
            config = {
                packages = { enable = true },
                project = {
                    enable = false,
                }
            },                     --  config used for theme
            hide = {
                statusline = true, -- hide statusline default is true
                tabline = true,
                winbar = true,
            },
        }
    end,
    dependencies = { { "nvim-tree/nvim-web-devicons" } }
}
