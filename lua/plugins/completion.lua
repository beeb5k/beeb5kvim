return {
    {
        "colorful-menu.nvim",
        for_cat = "general.blink",
        on_plugin = { "blink.cmp" },
    },
    {
        "friendly-snippets",
        dep_of = { "luasnip" },
    },
    {
        "luasnip",
        for_cat = "general.blink",
        dep_of = { "blink.cmp" },
        after = function(_)
            local luasnip = require("luasnip")
            require("luasnip.loaders.from_vscode").lazy_load()
            luasnip.config.setup({})

            local ls = require("luasnip")
            local s = ls.snippet
            local t = ls.text_node
            local i = ls.insert_node
            local extras = require("luasnip.extras")
            local rep = extras.rep
            local fmta = require("luasnip.extras.fmt").fmta
            local c = ls.choice_node
            local f = ls.function_node
            local d = ls.dynamic_node
            local sn = ls.snippet_node

            vim.keymap.set({ "i", "s" }, "<M-n>", function()
                if ls.choice_active() then
                    ls.change_choice(1)
                end
            end)
        end,
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
                signature = {
                    enabled = true,
                    window = {
                        show_documentation = true,
                    },
                },
                completion = {
                    documentation = {
                        auto_show = true,
                        auto_show_delay_ms = 200,
                    },

                    menu = {
                        draw = {
                            columns = { { "label", "label_description", gap = 1 }, { "kind_icon", "kind", gap = 1 } },
                            treesitter = { "lsp" },
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
                snippets = { preset = "luasnip" },
                sources = {
                    default = { "lsp", "path", "snippets", "buffer", "cmdline", "omni" },
                },
                fuzzy = { implementation = "prefer_rust_with_warning" },
            })
        end,
    },
}
