vim.lsp.inlay_hint.enable(true)
vim.lsp.enable({ "clangd", "lua_ls", "nixd", "zls", "zuban", "qmlls" })
vim.lsp.config("*", {
    capabilities = { textDocument = { semanticTokens = { multilineTokenSupport = true } } },
    root_markers = { ".git", ".editorconfig", "flake.nix", "shell.nix", "flake.lock" },
})

local RustLsp = function(mode, keymap, action, bufnr)
    vim.keymap.set(mode, keymap, function()
        vim.cmd.RustLsp(action)
    end, { silent = true, buffer = bufnr })
end

vim.g.rustaceanvim = {
    tools = {},
    server = {
        on_attach = function(client, bufnr)
            RustLsp({ "n", "x" }, "gra", "codeAction", bufnr)
            RustLsp("n", "<leader>ee", "explainError", bufnr)
            RustLsp("n", "K", { "hover", "actions" }, bufnr)
            RustLsp("n", "L", { "hover", "range" }, bufnr)
        end,
        default_settings = {
            ["rust-analyzer"] = {
                checkOnSave = {
                    enable = true,
                    command = "clippy",
                },
                procMacro = {
                    enable = true,
                },
            },
        },
    },
    dap = {},
}
