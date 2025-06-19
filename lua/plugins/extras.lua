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
    {
        "obsidian.nvim",
        for_cats = "extras.markdown",
        ft = { "markdown" },
        after = function(_)
            require("obsidian").setup({
                workspaces = {
                    {
                        name = "personal",
                        path = "~/vaults/personal",
                    },
                },
            })
        end,
    },
    {
        "render-markdown.nvim",
        for_cat = "extras.markdown",
        ft = "markdown",
        after = function(_)
            require("render-markdown").setup({})
        end,
    },
    {
        "markdown-preview.nvim",
        for_cat = "extras.markdown",
        cmd = { "MarkdownPreview", "MarkdownPreviewStop", "MarkdownPreviewToggle" },
        ft = "markdown",
        keys = {
            { "<leader>mp", "<cmd>MarkdownPreview <CR>", mode = { "n" }, noremap = true, desc = "markdown preview" },
            {
                "<leader>ms",
                "<cmd>MarkdownPreviewStop <CR>",
                mode = { "n" },
                noremap = true,
                desc = "markdown preview stop",
            },
            {
                "<leader>mt",
                "<cmd>MarkdownPreviewToggle <CR>",
                mode = { "n" },
                noremap = true,
                desc = "markdown preview toggle",
            },
        },
        before = function(_)
            vim.g.mkdp_auto_close = 0
        end,
    },
}
