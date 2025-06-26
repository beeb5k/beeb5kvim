return {
    {
        "nvim-ts-autotag",
        event = { "InsertEnter" },
        for_cats = "extras.core",
        after = function()
            require("nvim-ts-autotag").setup({
                opts = {
                    enable_close = true,
                    enable_rename = true,
                    enable_close_on_slash = false,
                },
            })
        end,
    },
    {
        "ultimate-autopair.nvim",
        event = { "InsertEnter", "CmdlineEnter" },
        for_cats = "extras.core",
        after = function()
            require("ultimate-autopair").setup()
        end,
    },
    {
        "nvim-surround",
        event = { "DeferredUIEnter" },
        for_cats = "extras.core",
        after = function()
            require("nvim-surround").setup({})
        end,
    },
    {
        "tabout.nvim",
        event = { "InsertEnter" },
        for_cats = "extras.core",
        after = function()
            require("tabout").setup({
                tabkey = "<Tab>",
                backwards_tabkey = "<S-Tab>",
                act_as_tab = true,
                act_as_shift_tab = false,
                default_tab = "<C-t>",
                default_shift_tab = "<C-d>",
                enable_backwards = true,
                completion = true,
                tabouts = {
                    { open = "'", close = "'" },
                    { open = '"', close = '"' },
                    { open = "`", close = "`" },
                    { open = "(", close = ")" },
                    { open = "[", close = "]" },
                    { open = "{", close = "}" },
                },
                ignore_beginning = true,
                exclude = {},
            })
        end,
    },
}
