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
		sidebars = "dark", -- style for sidebars, see below
		floats = "dark", -- style for floating windows
	},
})

vim.cmd([[colorscheme tokyonight]])
