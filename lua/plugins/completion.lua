return {
    {
        "blink.cmp",
        event = { "InsertEnter" },
        for_cat = "general.blink",
        on_require = "blink",
        after = function(plugin)
            require("blink.cmp").setup({
                keymap = { preset = "default" },
                appearance = {
                    nerd_font_variant = "mono",
                },
                signature = { enabled = true },
                completion = { documentation = { auto_show = false } },
                sources = {
                    default = { "lsp", "path", "snippets", "buffer", "cmdline", "omni" },
                },
                fuzzy = { implementation = "prefer_rust_with_warning" },
            })
        end,
    },
}
