vim.lsp.inlay_hint.enable(true)

vim.diagnostic.config({
    virtual_lines = {
        current_line = true,
    },
})

vim.lsp.enable({ "clangd", "lua_ls", "rust_analyzer" })
vim.lsp.config("*", {
    capabilities = { textDocument = { semanticTokens = { multilineTokenSupport = true } } },
    root_markers = { ".git", ".editorconfig", "flake.nix", "shell.nix", "flake.lock" },
})
