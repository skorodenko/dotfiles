-- which-key mappings
require("which-key").add({
    { "<leader>s",  group = "System" },
    { "<leader>sM", "<cmd>Mason<cr>",                             desc = "Open Mason" },
    { "<leader>sL", "<cmd>Lazy<cr>",                              desc = "Open Lazy" },
    { "<leader>st", "<cmd>ToggleTerm<cr>",                        desc = "Toggle terminal" },
    { "<leader>f",  group = "File" },
    { "<leader>ff", "<cmd>Telescope find_files<cr>",              desc = "Find files" },
    { "<leader>fb", "<cmd>Telescope buffers<cr>",                 desc = "Find buffer" },
    { "<leader>fd", "<cmd>Telescope fd<cr>",                      desc = "Find fuzzy" },
    { "<leader>fg", "<cmd>Telescope live_grep<cr>",               desc = "Live grep" },
    { "<leader>e",  group = "Explorer" },
    { "<leader>ee", "<cmd>Neotree toggle<cr>",                    desc = "Toggle tree" },
    { "<leader>l",  group = "LSP" },
    { "<leader>lf", "<cmd>lua vim.lsp.buf.format()<cr>",          desc = "Format file" },
    { "<leader>ld", "<cmd>lua vim.lsp.buf.hover()<cr>",           desc = "Hover info" },
    { "<leader>la", "<cmd>lua vim.lsp.buf.code_action()<cr>",     desc = "Code action" },
    { "<leader>lt", "<cmd>lua vim.lsp.buf.definition()<cr>",      desc = "Code definition" },
    { "<leader>p",  group = "Project" },
    { "<leader>pf", "<cmd>Telescope neovim-project discover<cr>", desc = "Project discover" },
    { "<leader>ph", "<cmd>Telescope neovim-project history<cr>",  desc = "Project history" },
    { "<leader>g",  group = "Git" },
    { "<leader>gp", "<cmd>Gitsigns preview_hunk<cr>",             desc = "Preview hunk" },
    { "<leader>gr", "<cmd>Gitsigns reset_hunk<cr>",               desc = "Reset hunk" },
    { "<leader>gt", "<cmd>Gitsigns toggle_signs<cr>",             desc = "Toggle git signs" },
})

local ok, _ = pcall(vim.cmd, "colorscheme kanagawa-dragon")
if not ok then
  vim.cmd "colorscheme default" -- if the above fails, then use default
end
