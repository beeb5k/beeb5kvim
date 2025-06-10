vim.lsp.enable({
    "clangd",
    "lua_ls",
    "rust_analyzer",
})

vim.lsp.inlay_hint.enable(true)

vim.diagnostic.config({
    update_in_insert = true,
    virtual_lines = {
        current_line = true,
    },
})

-- vim.api.nvim_create_autocmd("CursorHold", {
-- 	callback = function()
-- 		vim.diagnostic.open_float(nil, { focusable = false, source = "if_many" })
-- 	end,
-- })

vim.lsp.config("*", {
    capabilities = {
        textDocument = {
            semanticTokens = {
                multilineTokenSupport = true,
            },
        },
    },
    root_markers = { ".git", ".editorconfig", "flake.nix", "shell.nix", "flake.lock" },
})

vim.lsp.config("clangd", {
    cmd = { "clangd", "--clang-tidy" },
    filetypes = { "c", "cpp", "objc", "objcpp", "cuda" },
    root_markers = { "compile_commands.json", "compile_flags.txt", ".clangd" },
    settings = {
        clangd = {
            InlayHints = {
                Enabled = true,
                ParameterNames = true,
                TypeHints = true,
                ChainedCalls = true,
            },
            fallbackFlags = { "-std=c17" },
        },
    },
})

vim.lsp.config("lua_ls", {
    cmd = { "lua-language-server" },
    filetypes = { "lua" },
    settings = {
        Lua = {
            hint = {
                enabled = true,
            },
            runtime = {
                version = "LuaJIT",
            },
            formatters = {
                ignoreComments = true,
            },
            signatureHelp = {
                enabled = true,
            },
            diagnostics = {
                globals = { "vim" },
                disable = { "missing-fields" },
            },
            workspace = {
                checkThirdParty = false,
                library = {
                    -- '${3rd}/luv/library',
                    unpack(vim.api.nvim_get_runtime_file("", true)),
                },
            },
            completion = {
                callSnippet = "Replace",
            },
            telemetry = {
                enabled = false,
            },
        },
    },
})

vim.lsp.config("rust_analyzer", {
    cmd = { "rust-analyzer" },
    filetypes = { "rust" },
    root_markers = { "Cargo.toml" },
    settings = {
        ["rust-analyzer"] = {
            inlayHints = {
                enable = true,
                bindingModeHints = { enable = true },
                chainingHints = { enable = true },
                closingBraceHints = { enable = true },
                closureCaptureHints = { enable = true },
                closureReturnTypeHints = { enable = "always" },
                lifetimeElisionHints = { enable = "skip_trivial" },
                parameterHints = { enable = true },
                typeHints = { enable = true },
            },
            cargo = {
                features = "all",
            },
            check = {
                command = "clippy",
            },
            diagnostics = {
                enable = true,
            },
            procMacro = {
                enable = true,
            },
        },
    },
})
