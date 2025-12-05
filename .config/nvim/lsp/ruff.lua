return require("coq").lsp_ensure_capabilities({
    on_attach = function(client, buffer)
        if client.name == "ruff_lsp" then
            -- Disable hover in favor of Pyright
            client.server_capabilities.hoverProvider = false
        end
    end
})
