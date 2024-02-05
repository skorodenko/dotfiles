lvim.plugins = {
  "sainnhe/gruvbox-material",
  { "catppuccin/nvim", name = "catppuccin", priority = 1000 },
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {},
  },
  {
    "rebelot/kanagawa.nvim",
    config = function()
      require('kanagawa').setup({
        transparent = true,         -- do not set background color
        colors = {                   -- add/modify theme and palette colors
            theme = {
              all = {
                ui = { -- WAS MISSING THIS LEVEL
                  bg_gutter = 'none',
                  bg_p1 = 'none',
                },
              }
            },
        },
        theme = "wave",              -- Load "wave" theme when 'background' option is not set
        background = {               -- map the value of 'background' option to a theme
            dark = "wave",           -- try "dragon" !
            light = "lotus"
        },
      })
    end
  },
}

