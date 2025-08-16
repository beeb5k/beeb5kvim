require("LSPs.web")
vim.lsp.enable({
    "clangd",
    "lua_ls",
    "rust_analyzer",
    "nil_ls",
    "nixd",
    "tsserver",
    "marksman",
    "harper",
    "bashls",
    "gopls",
    "pyrefly",
    "qmlls",
    -- "jdtls",
})

vim.lsp.inlay_hint.enable(true)

local diagnostic_float_opts = {
    cursor_autoclose = true,
    focusable = false,
    close_events = { "BufLeave", "CursorMoved", "InsertCharPre" },
    source = "if_many",
    severity_sort = true,
    max_width = 90,
}

vim.keymap.set("n", "<C-l>", function()
    vim.diagnostic.open_float(diagnostic_float_opts)
end, { desc = "Show diagnostics for current line" })

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

vim.lsp.config("marksman", {
    cmd = { "marksman", "server" },
    filetypes = { "markdown", "markdown.mdx" },
    root_markers = { ".git", ".marksman.toml" }, -- or your project markers
})

vim.lsp.config("harper", {
    cmd = { "harper-ls", "--stdio" },
    filetypes = { "markdown", "text", "gitcommit" },
})

vim.lsp.config("qmlls", {
    cmd = { "qmlls" },
    filetypes = { "qml" },
    root_markers = { ".qmlls.ini" },
})

vim.lsp.config("jdtls", {
    filetypes = { "java" },
})

vim.lsp.config("bashls", {
    cmd = { "bash-language-server", "start" },
    filetypes = { "bash", "sh" },
})

vim.lsp.config("nil_ls", {
    cmd = { "nil" },
    filetypes = { "nix" },
})

vim.lsp.config("nixd", {
    cmd = { "nixd" },
    filetypes = { "nix" },
    root_dir = vim.fs.root(0, { "flake.nix", "shell.nix", ".git" }),
    settings = {
        nixd = {
            inlayHints = {
                enable = true,
            },
        },
    },
    on_attach = function(client)
        client.server_capabilities.documentFormattingProvider = false
        client.server_capabilities.diagnosticProvider = false
    end,
})

vim.lsp.config("pyrefly", {
    cmd = { "pyrefly", "lsp" },
    filetypes = { "python" },
    root_markers = { "pyrefly.toml", "pyproject.toml" },
    settings = {
        pyrefly = {
            inlayHints = true,
        },
    },
})

vim.lsp.config("clangd", {
    cmd = { "clangd" },
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

vim.lsp.config("gopls", {
    cmd = { "gopls" },
    filetypes = { "go", "gomod", "gowork", "gotmpl", "templ" },
    root_markers = { "go.mod" },
    settings = {
        gopls = {
            analyses = {
                unusedparams = true,
                useany = true,
                nilness = true,
            },
            staticcheck = true,
            codelenses = {
                test = true,
                tidy = true,
                upgrade_dependency = true,
            },
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
                -- chainingHints = true,
                -- parameterHints = true,
                -- typeHints = true,
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
                    enable = true,
                },
            },
            procMacro = {
                enable = true,
            },
        },
    },
})
