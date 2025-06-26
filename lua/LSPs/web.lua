vim.lsp.config("tsserver", {
    cmd = { "typescript-language-server", "--stdio" },
    filetypes = {
        "typescript",
        "typescriptreact",
        "typescript.tsx",
        "javascript",
        "javascriptreact",
        "javascript.jsx",
    },
    root_markers = { "package.json", "tsconfig.json", "jsconfig.json" },

    init_options = {
        preferences = {
            includeInlayParameterNameHints = "all", -- or "literals" / "none"
            includeInlayParameterNameHintsWhenArgumentMatchesName = false,
            includeInlayFunctionParameterTypeHints = false,
            includeInlayVariableTypeHints = false,
            includeInlayPropertyDeclarationTypeHints = false,
            includeInlayFunctionLikeReturnTypeHints = false,
            includeInlayEnumMemberValueHints = true,
        },
    },
})

vim.lsp.config("html", {
    cmd = { "vscode-html-language-server", "--stdio" },
    filetypes = { "html" },
    settings = {
        html = {
            format = {
                wrapAttributes = "auto",
                wrapAttributesIndentSize = 2,
                wrapLineLength = 80,
            },
        },
    },
})

vim.lsp.config("jsonls", {
    cmd = { "vscode-json-languageserver", "--stdio" },
    filetypes = { "json", "jsonc" },
    settings = {
        json = {
            format = {
                enable = true,
                options = {
                    tabSize = 2,
                    insertSpaces = true,
                },
            },
        },
    },
})

vim.lsp.config("cssls", {
    cmd = { "vscode-css-language-server", "--stdio" },
    filetypes = { "css", "scss", "less" },
    settings = {
        css = {
            validate = true,
            format = {
                enable = true,
                options = {
                    tabSize = 2,
                    insertSpaces = true,
                },
            },
        },
    },
})

vim.lsp.config("tailwindcss", {
    cmd = { "tailwindcss-language-server", "--stdio" },
    filetypes = {
        "astro",
        "astro-markdown",
        "ejs",
        "html",
        "htmlangular",
        "css",
        "less",
        "postcss",
        "sass",
        "scss",
        "javascriptreact",
        "typescriptreact",
        "vue",
        "svelte",
    },
    -- settings = {
    --   tailwindCSS = {
    --     validate = true,
    --     lint = {
    --       cssConflict = "warning",
    --       invalidApply = "error",
    --       invalidScreen = "error",
    --       invalidVariant = "error",
    --     },
    --   },
    -- },
})
