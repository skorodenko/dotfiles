return {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        -- "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
        "MunifTanjim/nui.nvim",
        -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
    },
    config = function()
        -- If you want icons for diagnostic errors, you'll need to define them somewhere:
        vim.fn.sign_define("DiagnosticSignError",
            { text = " ", texthl = "DiagnosticSignError" })
        vim.fn.sign_define("DiagnosticSignWarn",
            { text = " ", texthl = "DiagnosticSignWarn" })
        vim.fn.sign_define("DiagnosticSignInfo",
            { text = " ", texthl = "DiagnosticSignInfo" })
        vim.fn.sign_define("DiagnosticSignHint",
            { text = "󰌵", texthl = "DiagnosticSignHint" })

        require("neo-tree").setup({
            close_if_last_window = false,
            popup_border_style = "rounded",
            enable_git_status = true,
            enable_diagnostics = true,
            default_component_configs = {
                icon = {
                    folder_closed = "",
                    folder_open = "",
                    folder_empty = "󰜌",
                    default = "*",
                    highlight = "NeoTreeFileIcon"
                },
                modified = {
                    symbol = "[+]",
                    highlight = "NeoTreeModified",
                },
                git_status = {
                    symbols = {
                        -- Change type
                        added     = "", -- or "✚", but this is redundant info if you use git_status_colors on the name
                        modified  = "", -- or "", but this is redundant info if you use git_status_colors on the name
                        deleted   = "✖", -- this can only be used in the git_status source
                        renamed   = "󰁕", -- this can only be used in the git_status source
                        -- Status type
                        untracked = "[?]",
                        ignored   = "[-]",
                        unstaged  = "[ ]",
                        staged    = "[+]",
                        conflict  = "",
                    }
                },
            },
            window = {
                position = "float",
                width = 60,
            },
        })
    end
}
