if nixCats("core.completion.blink") then
    return {
        {
            "blink.cmp",
            event = { "InsertEnter", "CmdlineEnter" },
            for_cat = "blink",
            after = function(_)
                require("blink.cmp").setup({
                    keymap = { preset = "default" },
                    appearance = {
                        nerd_font_variant = "mono",
                    },
                    signature = {
                        enabled = true,
                        -- window = {
                        --     show_documentation = true,
                        -- },
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
                    -- snippets = { preset = "luasnip" },
                    sources = {
                        default = { "lsp", "path", "snippets", "buffer", "cmdline" },
                    },
                    fuzzy = { implementation = "prefer_rust_with_warning" },
                })
            end,
        },
        {
            "blink.pairs",
            event = "InsertEnter",
            for_cat = "blink",
            after = function()
                require("blink.pairs").setup({})
            end,
        },
    }
elseif nixCats("core.completion.mini") then
    return {
        {
            "mini.completion",
            for_cat = "general",
            event = "InsertEnter",
            after = function()
                require("mini.completion").setup()
            end,
        },
    }
end

return {}
