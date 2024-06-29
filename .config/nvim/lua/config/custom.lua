-- configure colorscheme
vim.cmd.colorscheme("onedark_dark")

-- which-key mappings
require("which-key").register({
    s = {
        name = "System",
        M = { "<cmd>Mason<cr>", "Open Mason" },
        L = { "<cmd>Lazy<cr>", "Open Lazy" },
        t = { "<cmd>ToggleTerm<cr>", "Toggle terminal" }
    },
    f = {
        name = "File",
        f = { "<cmd>Telescope find_files<cr>", "Find file" },
        b = { "<cmd>Telescope buffers<cr>", "Find buffer" },
        d = { "<cmd>Telescope fd<cr>", "Find fuzzy" },
        g = { "<cmd>Telescope live_grep<cr>", "Live grep" },
    },
    e = {
        name = "Explorer",
        e = { "<cmd>Neotree toggle<cr>", "Toggle tree" },
    },
    l = {
        name = "LSP",
        f = { "<cmd>lua vim.lsp.buf.format()<cr>", "Format file" },
        d = { "<cmd>lua vim.lsp.buf.hover()<cr>", "Show hover info" }
    },
    p = {
        name = "Project",
        f = { "<cmd>Telescope neovim-project discover<cr>", "Project discover" },
        h = { "<cmd>Telescope neovim-project history<cr>", "Project history" }
    },
    t = {
        name = "Tools",
    }
}, { prefix = "<leader>" })
