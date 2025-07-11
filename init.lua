require("config")
require("LSPs")
require("lze").load({ { import = "plugins" } })

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
        sidebars = "dark", -- style for sidebars, see below
        floats = "transparent", -- style for floating windows
    },
    on_highlights = function(hl, c)
        hl.CursorLineNr = {
            fg = c.purple,
            bold = false,
        }
    end,
})

require("kanagawa").setup({
    compile = false, -- enable compiling the colorscheme
    undercurl = true, -- enable undercurls
    commentStyle = { italic = true },
    functionStyle = {},
    keywordStyle = { italic = true },
    statementStyle = { bold = false },
    typeStyle = {},
    transparent = true, -- do not set background color
    dimInactive = false, -- dim inactive window `:h hl-NormalNC`
    terminalColors = true, -- define vim.g.terminal_color_{0,17}
    colors = { -- add/modify theme and palette colors
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
    overrides = function(colors) -- add/modify highlights
        return {}
    end,
    theme = "dragon", -- Load "wave" theme
    background = { -- map the value of 'background' option to a theme
        dark = "dragon", -- try "dragon" !
        light = "lotus",
    },
})

-- vim.cmd("colorscheme kanagawa")

vim.cmd([[colorscheme tokyonight]])
