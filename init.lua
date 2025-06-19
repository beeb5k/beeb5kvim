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

vim.cmd([[colorscheme tokyonight]])
