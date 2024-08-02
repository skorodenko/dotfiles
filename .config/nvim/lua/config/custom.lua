-- configure colorscheme
vim.cmd.colorscheme("onedark_dark")

-- which-key mappings
require("which-key").add({
    { "<leader>s", group = "System" },
    { "<leader>sM", "<cmd>Mason<cr>", desc = "Open Mason" },
    { "<leader>sL", "<cmd>Lazy<cr>", desc = "Open Lazy" },
    { "<leader>st", "<cmd>ToggleTerm<cr>", desc = "Toggle terminal" },
    { "<leader>f", group = "File" },
    { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find files" },
    { "<leader>fb", "<cmd>Telescope buffers<cr>", desc = "Find buffer" },
    { "<leader>fd", "<cmd>Telescope fd<cr>", desc = "Find fuzzy" },
    { "<leader>fg", "<cmd>Telescope live_grep<cr>", desc = "Live grep" },
    { "<leader>e", group = "Explorer" },
    { "<leader>ee", "<cmd>Neotree toggle<cr>", desc = "Toggle tree" },
    { "<leader>l", group = "LSP" },
    { "<leader>lf", "<cmd>lua vim.lsp.buf.format()<cr>", desc = "Format file" },
    { "<leader>ld", "<cmd>lua vim.lsp.buf.hover()<cr>", desc = "Hover info" },
    { "<leader>p", group = "Project" },
    { "<leader>pf", "<cmd>Telescope neovim-project discover<cr>", desc = "Project discover" },
    { "<leader>ph", "<cmd>Telescope neovim-project history<cr>", desc = "Project history" },
})
