local lsp = require("lspconfig")
local coq = require("coq")


lsp.pyright.setup(coq.lsp_ensure_capabilities({
    settings = {
        pyright = {
            disableOrganizeImports = true,
            disableTaggedHints = true,
        },
        python = {
            analysis = {
                diagnosticSeverityOverrides = {
                    reportUndefinedVariable = "none",
                },
            },
        },
    },
}))
lsp.ruff.setup(coq.lsp_ensure_capabilities({
    on_attach = function(client, buffer)
        if client.name == "ruff_lsp" then
            -- Disable hover in favor of Pyright
            client.server_capabilities.hoverProvider = false
        end
    end
}))


lsp.marksman.setup(coq.lsp_ensure_capabilities({}))


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
            -- diagnostics = {
            --     enable = true,
            -- }
        }
    }
}))


lsp.qmlls.setup(coq.lsp_ensure_capabilities({
    cmd = { "qmlls6" }
}))


lsp.taplo.setup(coq.lsp_ensure_capabilities({}))
