if nixCats("core.completion.blink") then
    return {
        {
            "blink.cmp",
            event = { "InsertEnter", "CmdlineEnter" },
            for_cat = "core.completion.blink",
            load = function(name)
                require("lzextras").loaders.multi({
                    name,
                    -- "blink-ripgrep.nvim",
                    "friendly-snippets",
                })
            end,
            after = function(_)
                require("blink.cmp").setup({
                    keymap = { preset = "default" },
                    appearance = {
                        nerd_font_variant = "mono",
                    },
                    signature = {
                        enabled = true,
                        window = {
                            show_documentation = true,
                        },
                    },
                    completion = {
                        documentation = {
                            auto_show = false,
                            auto_show_delay_ms = 200,
                        },

                        menu = {
                            draw = {
                                columns = {
                                    { "label", "label_description", gap = 1 },
                                    { "kind_icon", "kind", gap = 1 },
                                },
                                treesitter = { "lsp" },
                            },
                        },
                    },
                    sources = {
                        default = { "lsp", "path", "snippets", "buffer", "cmdline", "omni" },
                        providers = {
                            path = {
                                score_offset = 25,
                            },
                            lsp = {
                                fallbacks = {},
                                score_offset = 20,
                            },
                            snippets = {
                                score_offset = 20,
                            },
                            buffer = {
                                score_offset = 5,
                            },
                            -- ripgrep = {
                            --     module = "blink-ripgrep",
                            --     name = "Ripgrep",
                            --     opts = {
                            --         project_root_marker = { ".git", "flake.nix", "flake.lock" },
                            --         backend = {
                            --             use = "gitgrep-or-ripgrep",
                            --             customize_icon_highlight = false,
                            --         },
                            --     },
                            -- },
                        },
                    },
                    fuzzy = { implementation = "prefer_rust_with_warning" },
                })
            end,
        },
        {
            "blink.pairs",
            event = "InsertEnter",
            for_cat = "core.completion.blink",
            after = function()
                require("blink.pairs").setup({

                    highlights = {
                        enabled = false,
                        groups = {
                            "Type",
                            "Boolean",
                            -- "Keyword",
                            "Function",
                            unmatched = "Error",
                            matchparen = "MatchParen",
                        },
                    },
                })
            end,
        },
    }
elseif nixCats("core.completion.mini") then
    return {
        {
            "mini.completion",
            for_cat = "core.completion.mini",
            event = "InsertEnter",
            after = function()
                require("mini.completion").setup()
            end,
        },
    }
end

return {}
