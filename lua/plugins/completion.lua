return {
    {
        "colorful-menu.nvim",
        for_cat = "general.blink",
        on_plugin = { "blink.cmp" },
    },
    {
        "blink.cmp",
        event = { "InsertEnter" },
        for_cat = "general.blink",
        on_require = "blink",
        after = function(_)
            require("blink.cmp").setup({
                keymap = { preset = "default" },
                appearance = {
                    nerd_font_variant = "mono",
                },
                signature = { enabled = true },
                completion = {
                    documentation = {
                        auto_show = false,
                        auto_show_delay_ms = 200,
                    },

                    menu = {
                        draw = {
                            components = {
                                label = {
                                    text = function(ctx)
                                        return require("colorful-menu").blink_components_text(ctx)
                                    end,
                                    highlight = function(ctx)
                                        return require("colorful-menu").blink_components_highlight(ctx)
                                    end,
                                },
                            },
                        },
                    },
                },
                sources = {
                    default = { "lsp", "path", "snippets", "buffer", "cmdline", "omni" },
                },
                fuzzy = { implementation = "prefer_rust_with_warning" },
            })
        end,
    },
}
