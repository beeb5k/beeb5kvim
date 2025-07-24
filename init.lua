require("config")
if vim.g.vscode == nil then
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

    require("catppuccin").setup({
        flavour = "auto",
        background = {
            light = "latte",
            dark = "frappe",
        },
        transparent_background = true, -- disables setting the background color.
        show_end_of_buffer = false, -- shows the '~' characters after the end of buffers
        term_colors = false, -- sets terminal colors (e.g. `g:terminal_color_0`)
        dim_inactive = {
            enabled = false, -- dims the background color of inactive window
            shade = "dark",
            percentage = 0.15, -- percentage of the shade to apply to the inactive window
        },
        no_italic = false, -- Force no italic
        no_bold = true, -- Force no bold
        no_underline = false, -- Force no underline
        styles = { -- Handles the styles of general hi groups (see `:h highlight-args`):
            comments = { "italic" }, -- Change the style of comments
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

    vim.cmd([[colorscheme catppuccin]])
end
