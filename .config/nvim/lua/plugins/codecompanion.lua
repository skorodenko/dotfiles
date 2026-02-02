return {
    "olimorris/codecompanion.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-treesitter/nvim-treesitter",
    },
    opts = {
        interactions = {
            chat = {
                adapter = "ollama",
                model = "mistralai/ministral-3-3b"
            },
        },
        opts = {
            log_level = "DEBUG",
        },
    },
}
