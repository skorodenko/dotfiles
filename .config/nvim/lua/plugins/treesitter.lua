return {
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
--        config = function()
--            local configs = require("nvim-treesitter.configs")
--
--            configs.setup({
--                auto_install = false,
--                sync_installed = false,
--                ensure_installed = {},
--                -- ensure_installed = { "lua", "vim", "vimdoc", "c", "python", "rust" },
--                highlight = { enable = true },
--                indent = { enable = true },
--            })
--        end
    }
}
