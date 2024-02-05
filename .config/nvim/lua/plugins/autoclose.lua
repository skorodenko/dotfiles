return {
    { "windwp/nvim-ts-autotag" },
    {
        "m4xshen/autoclose.nvim",
        config = function()
            require("autoclose").setup({
                keys = {
                    ["("] = { escape = false, close = false, pair = "()" },
                    ["["] = { escape = false, close = false, pair = "[]" },
                    ["{"] = { escape = false, close = false, pair = "{}" },

                    [">"] = { escape = false, close = false, pair = "<>" },
                    [")"] = { escape = false, close = false, pair = "()" },
                    ["]"] = { escape = false, close = false, pair = "[]" },
                    ["}"] = { escape = false, close = false, pair = "{}" },

                    ['"'] = { escape = false, close = false, pair = '""' },
                    ["'"] = { escape = false, close = false, pair = "''" },
                    ["`"] = { escape = false, close = false, pair = "``" },
                },
                options = {
                    disable_command_mode = true,
                },
            })
        end,
    },
}
