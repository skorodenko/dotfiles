return {
    { 
        "williamboman/mason.nvim",
	enabled = (vim.g.system_id ~= "nixos"),
        config = function()
            require("mason").setup({
                ui = {
                    border = "rounded",
                    icons = {
                        package_installed = "✓",
                        package_pending = "➜",
                        package_uninstalled = "✗"
                    }
                }
            })
        end,
    },
}
