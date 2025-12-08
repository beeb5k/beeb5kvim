return {
    {
        "conform.nvim",
        event = { "BufReadPre", "BufNewFile" },
        for_cats = "core.general",
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
                    nix = { "alejandra" },
                    go = { "gofmt" },
                    rust = { "rustfmt", lsp_format = "fallback" },
                    toml = { "tombi" },
                    python = {
                        "ruff_fix",
                        "ruff_format",
                        "ruff_organize_imports",
                    },
                    java = { "google-java-format" },
                    c = { "clang-format" },
                    cpp = { "clang-format" },
                    cmake = { "cmake-format" },
                    typescript = { "prettierd" },
                    javascript = { "prettierd" },
                },
            })

            vim.keymap.set({ "n", "v" }, "<leader>lf", function()
                conform.format({
                    lsp_fallback = true,
                    async = true,
                    timeout_ms = 500,
                })
            end, {
                desc = "Language format",
            })
        end,
    },
}
