vim.lsp.config("*", {
    capabilities = {
        textDocument = {
            semanticTokens = {
                multilineTokenSupport = true,
            },
        },
    },
    root_markers = { ".git", ".editorconfig", "flake.nix", "shell.nix", "flake.lock" },
})

vim.lsp.enable({
    "clangd",
    "lua_ls",
    "rust_analyzer",
})
require("config")

vim.lsp.inlay_hint.enable(true)

vim.diagnostic.config({
    virtual_lines = {
        current_line = true,
    },
})

if vim.g.vscode == nil then
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

                -- BlinkCmpMenu = { bg = "none", fg = theme.ui.shade0 },
                BlinkCmpMenuBorder = { bg = "none", fg = theme.ui.shade0 },
                -- BlinkCmpMenuSelection = { bg = "none", fg = theme.ui.fg },
                -- BlinkCmpScrollBarThumb = { bg = "none", fg = theme.ui.fg },
                -- BlinkCmpScrollBarGutter = { bg = "none", fg = theme.ui.fg_dim },
            }
        end,
        theme = "wave", -- Load "wave" theme
        background = { -- map the value of 'background' option to a theme
            dark = "wave", -- try "dragon" !
            light = "lotus",
        },
    })

    vim.cmd([[colorscheme kanagawa]])
end
