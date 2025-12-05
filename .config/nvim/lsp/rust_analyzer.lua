return require("coq").lsp_ensure_capabilities({
    settings = {
        ["rust-analyzer"] = {
            diagnostics = {
                enable = false,
            }
        }
    }
})
