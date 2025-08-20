require("tokyonight").setup({
    style = "moon",
    light_style = "day",
    transparent = true,
    dim_inactive = true,
    lualine_bold = false,
    cache = true,
    styles = {
        comments = { italic = true },
        keywords = { italic = true },
        functions = {},
        variables = {},
        colors = { bg_float = "none" },
        sidebars = "dark",
        floats = "transparent",
    },
    on_highlights = function(hl, c)
        hl.CursorLineNr = {
            fg = c.purple,
            bold = false,
        }
    end,
})

require("catppuccin").setup({
    flavour = "auto",
    background = {
        light = "latte",
        dark = "frappe",
    },
    transparent_background = true,
    show_end_of_buffer = false,
    term_colors = false,
    dim_inactive = {
        enabled = false,
        shade = "dark",
        percentage = 0.15,
    },
    no_italic = false,
    no_bold = true,
    no_underline = false,
    styles = {
        comments = { "italic" },
        conditionals = { "italic" },
        loops = {},
        functions = {},
        keywords = {},
        strings = {},
        variables = {},
        numbers = {},
        booleans = {},
        properties = {},
        types = {},
        operators = {},
    },
    color_overrides = {},
    custom_highlights = {},
    default_integrations = true,
    integrations = {
        blink_cmp = {
            style = "bordered",
        },
        snacks = {
            enabled = false,
        },
        gitsigns = true,
        nvimtree = true,
        treesitter = true,
        notify = false,
        mini = {
            enabled = true,
            indentscope_color = "",
        },
    },
})

require("kanagawa").setup({
    compile = false,
    undercurl = true,
    commentStyle = { italic = true },
    functionStyle = {},
    keywordStyle = { italic = true },
    statementStyle = { bold = false },
    typeStyle = {},
    transparent = true,
    dimInactive = false,
    terminalColors = true,
    colors = {
        palette = {},
        theme = {
            wave = {},
            lotus = {},
            dragon = {},
            all = {
                ui = {
                    bg_gutter = "none",
                    float = {
                        bg = "none",
                    },
                },
            },
        },
    },
    overrides = function(colors)
        local theme = colors.theme
        return {
            NormalFloat = { bg = "none" },
            FloatBorder = { bg = "none" },
            FloatTitle = { bg = "none" },
            LineNr = { bg = "none" },
            CursorLineNr = { bg = "none", fg = theme.syn.constant },
            StatusColumn = { bg = "none" },

            NormalDark = { fg = theme.ui.fg_dim, bg = theme.ui.bg_m3 },
            LazyNormal = { bg = theme.ui.bg_m3, fg = theme.ui.fg_dim },
            MasonNormal = { bg = theme.ui.bg_m3, fg = theme.ui.fg_dim },

            Pmenu = { bg = "none", fg = theme.ui.shade0 },
            PmenuSel = { bg = theme.ui.bg_p1, fg = theme.ui.fg },
            PmenuBorder = { bg = "none", fg = theme.ui.fg },

            BlinkCmpMenuBorder = { bg = "none", fg = theme.ui.shade0 },
        }
    end,
    theme = "wave",
    background = {
        dark = "wave",
        light = "lotus",
    },
})
