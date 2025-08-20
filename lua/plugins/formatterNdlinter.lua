return {
    {
        "conform.nvim",
        event = { "BufReadPre", "BufNewFile" },
        for_cats = "general.core",
        keys = { {
            "<leader>fm",
            desc = "[F]or[M]at",
        } },
        after = function()
            local conform = require("conform")

            conform.formatters["google-java-format"] = {
                prepend_args = { "--aosp" },
            }

            conform.setup({
                format_on_save = {
                    lsp_fallback = true,
                    timeout_ms = 500,
                },

                formatters_by_ft = {
                    lua = { "stylua" },
                    nix = { "nixfmt" },
                    -- go = { "gofmt" },
                    rust = { "rustfmt", lsp_format = "fallback" },
                    -- python = {
                    --     "ruff_fix",
                    --     "ruff_format",
                    --     "ruff_organize_imports",
                    -- },
                    -- java = { "google-java-format" },
                    c = { "clang-format" },
                    cpp = { "clang-format" },
                    cmake = { "cmake-format" },
                    typescript = { "prettierd" },
                    javascript = { "prettierd" },
                },
            })

            vim.keymap.set({ "n", "v" }, "<leader>fm", function()
                conform.format({
                    lsp_fallback = true,
                    async = true,
                    timeout_ms = 500,
                })
            end, {
                desc = "[F]or[M]at",
            })
        end,
    },
    {
        "nvim-lint",
        event = { "BufReadPre", "BufNewFile" },
        for_cats = "general.core",
        after = function(_)
            require("lint").linters_by_ft = {
                rust = { "clippy" },
                c = { "clangtidy" },
                cpp = { "clangtidy" },
                -- go = { "golangcilint" },
                javascript = { "eslint" },
                typescript = { "eslint" },
                -- python = { "ruff" },
            }

            vim.api.nvim_create_autocmd({ "BufWritePost", "BufEnter", "InsertLeave" }, {
                callback = function()
                    require("lint").try_lint()
                end,
            })
        end,
    },
}
