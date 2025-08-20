return {
    cmd = { "rust-analyzer" },
    filetypes = { "rust" },
    root_markers = { "Cargo.toml" },
    settings = {
        ["rust-analyzer"] = {
            checkOnSave = false,
            inlayHints = {
                chainingHints = true,
                parameterHints = true,
                typeHints = true,
                -- closingBraceHints = true,
                -- lifetimeElisionHints = {
                --     enable = "always",
                --     useParameterNames = true,
                -- },
                -- bindingModeHints = true,
                -- reborrowHints = true,
                -- closureReturnTypeHints = {
                --     enable = "always",
                -- },
            },
            cargo = {
                features = "all",
            },
            check = {
                command = "clippy",
            },
            diagnostics = {
                enable = true,
                experimental = {
                    enable = false,
                },
            },
            procMacro = {
                enable = true,
            },
        },
    },
}
