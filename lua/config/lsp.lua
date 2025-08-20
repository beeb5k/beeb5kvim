vim.lsp.inlay_hint.enable(true)

vim.diagnostic.config({
    virtual_text = {
        current_line = true,
    },
})

vim.lsp.enable({ "clangd", "lua_ls", "nixd", "rust_analyzer" })
vim.lsp.config("*", {
    capabilities = { textDocument = { semanticTokens = { multilineTokenSupport = true } } },
    root_markers = { ".git", ".editorconfig", "flake.nix", "shell.nix", "flake.lock" },
})
