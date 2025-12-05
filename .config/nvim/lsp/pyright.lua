return require("coq").lsp_ensure_capabilities({
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
})
