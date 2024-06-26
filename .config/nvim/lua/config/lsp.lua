local lsp = require("lspconfig")
local coq = require("coq")


lsp.ruff.setup({})
lsp.pyright.setup({
    settings = {
        pyright = {
            -- Using Ruff's import organizer
            disableOrganizeImports = true,
        },
        python = {
            analysis = {
                -- Ignore all files for analysis to exclusively use Ruff for linting
                ignore = { '*' },
            },
        },
    },
})


lsp.lua_ls.setup(coq.lsp_ensure_capabilities({
    on_init = function(client)
        client.config.settings.Lua = vim.tbl_deep_extend("force", client.config.settings.Lua, {
            runtime = { version = "LuaJIT" },
            workspace = {
                library = {
                    vim.env.VIMRUNTIME
                }
            }
        })
    end,
    settings = {
        Lua = {}
    }
}))


lsp.rust_analyzer.setup(coq.lsp_ensure_capabilities({
    settings = {
        ["rust"] = {
            --            diagnostics = {
            --                enable = false;
            --            }
        }
    }
}))


lsp.qmlls.setup(coq.lsp_ensure_capabilities({
    cmd = { "qmlls6" }
}))
