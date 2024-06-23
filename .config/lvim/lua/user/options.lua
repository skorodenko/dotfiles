-- Theme config
lvim.colorscheme = "catppuccin-mocha"
lvim.transparent_window = true
vim.g.gruvbox_material_background = "hard"
vim.g.gruvbox_material_foreground = "hard"
vim.g.gruvbox_material_transparent_background = "2"

-- Lualine config
lvim.builtin.lualine.sections.lualine_a = { "mode" }

-- Explorer config
-- close nvimtree when opening a file
lvim.builtin.nvimtree.setup.actions.open_file.quit_on_open = true
